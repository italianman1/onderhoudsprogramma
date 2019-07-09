using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Hefmiddelen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Hefmiddelen
{
    public class HefmiddelOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<Hefmiddel> _allHefmiddelen;
        private List<Hefmiddel> _Hefmiddelen;
        private string _searchString = "Zoek hier op code nummer";

        public HefmiddelOverzichtViewModel()
        {
            List<Hefmiddel> searchedHefmiddelen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Hefmiddelen = context.Hefmiddel.ToList();

                searchedHefmiddelen = Hefmiddelen;

                _allHefmiddelen = searchedHefmiddelen;
                _Hefmiddelen = searchedHefmiddelen;



                List<string> Hefmiddelen_keuring = new List<string>();

                foreach (var Hefmiddel in _allHefmiddelen)
                {
                    if (Hefmiddel.datum_herkeuring < DateTime.Today)
                    {
                        Hefmiddelen_keuring.Add(Hefmiddel.benaming + " " + Hefmiddel.merk + ", Datum herkeuring: " + Hefmiddel.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Hefmiddelen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen Hefmiddelen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Hefmiddelen_keuring);

                    MessageBox.Show("Deze Hefmiddelen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteHefmiddelCommand = new RelayCommand(deleteHefmiddel, canDelete);
            AddHefmiddelCommand = new RelayCommand(openAddWindow);
            EditHefmiddelCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteHefmiddelCommand { get; set; }
        public ICommand AddHefmiddelCommand { get; set; }
        public ICommand EditHefmiddelCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Hefmiddel> Hefmiddelen
        {
            get
            {
                return _Hefmiddelen;
            }

            set
            {
                _Hefmiddelen = value;
                RaisePropertyChanged("Hefmiddelen");
            }
        }


        public Hefmiddel SelectedHefmiddel { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedHefmiddelen = new List<Hefmiddel>();

                foreach (var Hefmiddel in _allHefmiddelen)
                    if ((_searchString != null) && Hefmiddel.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedHefmiddelen.Add(Hefmiddel);
                    }


                _Hefmiddelen = searchedHefmiddelen;

                RaisePropertyChanged("Hefmiddelen");
            }
        }

        public void deleteHefmiddel()
        {
            if (SelectedHefmiddel != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze Hefmiddel wilt verwijderen?", "Verwijder " + SelectedHefmiddel.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var Hefmiddelen = context.Hefmiddel.ToList();

                        foreach (var Hefmiddel in Hefmiddelen)
                            if (Hefmiddel.Id == SelectedHefmiddel.Id)
                                context.Hefmiddel.Remove(Hefmiddel);
                        context.SaveChanges();


                        _Hefmiddelen = context.Hefmiddel.ToList();
                        _allHefmiddelen = context.Hefmiddel.ToList();
                    }


                    RaisePropertyChanged("Hefmiddelen");
                }
                else if (dialogResult == MessageBoxResult.No)
                {

                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een Hefmiddel die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedHefmiddel != null)

                if (SelectedHefmiddel.stamkaart == null)
                    MessageBox.Show("Deze Hefmiddel heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedHefmiddel.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een Hefmiddel waarvan u de stamkaart wilt openen");

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Hefmiddelen = context.Hefmiddel.ToList();
                _allHefmiddelen = context.Hefmiddel.ToList();

            }

            RaisePropertyChanged("Hefmiddelen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddHefmiddelView());
        }

        public void openEditWindow()
        {
            if (SelectedHefmiddel != null)
                Navigator.SetNewView(new EditHefmiddelView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een Hefmiddel die u wilt wijzigen");
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
