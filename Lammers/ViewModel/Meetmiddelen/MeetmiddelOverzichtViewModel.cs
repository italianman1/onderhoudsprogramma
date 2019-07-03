using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Meetmiddelen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Meetmiddelen
{
    public class MeetmiddelOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<Meetmiddel> _allMeetmiddelen;
        private List<Meetmiddel> _Meetmiddelen;
        private string _searchString = "Zoek hier op codenummer";

        public MeetmiddelOverzichtViewModel()
        {
            List<Meetmiddel> searchedMeetmiddelen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Meetmiddelen = context.Meetmiddel.ToList();

                searchedMeetmiddelen = Meetmiddelen;

                _allMeetmiddelen = searchedMeetmiddelen;
                _Meetmiddelen = searchedMeetmiddelen;



                List<string> Meetmiddelen_keuring = new List<string>();

                foreach (var meetmiddel in _allMeetmiddelen)
                {
                    if (meetmiddel.datum_herkeuring < DateTime.Today)
                    {
                        Meetmiddelen_keuring.Add(meetmiddel.benaming + " Code nr " + meetmiddel.code_nr + ", Datum herkeuring: " + meetmiddel.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Meetmiddelen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen meetmiddelen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Meetmiddelen_keuring);

                    MessageBox.Show("Deze meetmiddelen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteMeetmiddelCommand = new RelayCommand(deleteMeetmiddel, canDelete);
            AddMeetmiddelCommand = new RelayCommand(openAddWindow);
            EditMeetmiddelCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteMeetmiddelCommand { get; set; }
        public ICommand AddMeetmiddelCommand { get; set; }
        public ICommand EditMeetmiddelCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Meetmiddel> Meetmiddelen
        {
            get
            {
                return _Meetmiddelen;
            }

            set
            {
                _Meetmiddelen = value;
                RaisePropertyChanged("Meetmiddelen");
            }
        }


        public Meetmiddel SelectedMeetmiddel { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedMeetmiddelen = new List<Meetmiddel>();

                foreach (var pomp in _allMeetmiddelen)
                    if ((_searchString != null) && pomp.code_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedMeetmiddelen.Add(pomp);
                    }


                Meetmiddelen = searchedMeetmiddelen;
            }
        }

        public void deleteMeetmiddel()
        {
            if (SelectedMeetmiddel != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze Meetmiddel wilt verwijderen?", "Verwijder " + SelectedMeetmiddel.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var Meetmiddelen = context.Meetmiddel.ToList();

                        foreach (var Meetmiddel in Meetmiddelen)
                            if (Meetmiddel.Id == SelectedMeetmiddel.Id)
                                context.Meetmiddel.Remove(Meetmiddel);
                        context.SaveChanges();


                        _Meetmiddelen = context.Meetmiddel.ToList();
                        _allMeetmiddelen = context.Meetmiddel.ToList();
                    }


                    RaisePropertyChanged("Meetmiddelen");
                }
                else if (dialogResult == MessageBoxResult.No)
                {

                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een Meetmiddel die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedMeetmiddel != null)

                if (SelectedMeetmiddel.stamkaart == null)
                    MessageBox.Show("Deze Meetmiddel heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedMeetmiddel.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een Meetmiddel waarvan u de stamkaart wilt openen");

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Meetmiddelen = context.Meetmiddel.ToList();
                _allMeetmiddelen = context.Meetmiddel.ToList();

            }

            RaisePropertyChanged("Meetmiddelen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddMeetmiddelView());
        }

        public void openEditWindow()
        {
            if (SelectedMeetmiddel != null)
                Navigator.SetNewView(new EditMeetmiddelView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een Meetmiddel die u wilt wijzigen");
        }


        private void PerformBack()
        {
            Navigator.SetNewView(new OverzichtView());
        }

        private void RaisePropertyChanged(string prop)
        {
            if (PropertyChanged != null) PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
