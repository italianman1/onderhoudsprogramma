using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Verfpompen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Verfpompen
{
    public class VerfpompOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<Verfpomp> _allVerfpompen;
        private List<Verfpomp> _Verfpompen;
        private string _searchString = "Zoek hier op codenummer";

        public VerfpompOverzichtViewModel()
        {
            List<Verfpomp> searchedPompen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Verfpompen = context.Verfpomp.ToList();

                searchedPompen = Verfpompen;

                _allVerfpompen = searchedPompen;
                _Verfpompen = searchedPompen;



                List<string> Pompen_keuring = new List<string>();

                foreach (var pomp in _allVerfpompen)
                {
                    if (pomp.datum_herkeuring < DateTime.Today)
                    {
                        Pompen_keuring.Add(pomp.benaming + " LAM " + pomp.code_nr + ", Datum herkeuring: " + pomp.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Pompen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen pompen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Pompen_keuring);

                    MessageBox.Show("Deze pompen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteVerfpompCommand = new RelayCommand(deleteVerfpomp, canDelete);
            AddVerfpompCommand = new RelayCommand(openAddWindow);
            EditVerfpompCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteVerfpompCommand { get; set; }
        public ICommand AddVerfpompCommand { get; set; }
        public ICommand EditVerfpompCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Verfpomp> Verfpompen
        {
            get
            {
                return _Verfpompen;
            }

            set
            {
                _Verfpompen = value;
                RaisePropertyChanged("Verfpompen");
            }
        }


        public Verfpomp SelectedVerfpomp { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedVerfpompen = new List<Verfpomp>();

                foreach (var pomp in _allVerfpompen)
                    if ((_searchString != null) && pomp.code_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedVerfpompen.Add(pomp);
                    }


                Verfpompen = searchedVerfpompen;
            }
        }

        public void deleteVerfpomp()
        {
            if (SelectedVerfpomp != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze Verfpomp wilt verwijderen?", "Verwijder " + SelectedVerfpomp.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var Verfpompen = context.Verfpomp.ToList();

                        foreach (var Verfpomp in Verfpompen)
                            if (Verfpomp.Id == SelectedVerfpomp.Id)
                                context.Verfpomp.Remove(Verfpomp);
                        context.SaveChanges();


                        _Verfpompen = context.Verfpomp.ToList();
                        _allVerfpompen = context.Verfpomp.ToList();
                    }


                    RaisePropertyChanged("Verfpompen");
                }
                else if (dialogResult == MessageBoxResult.No)
                {

                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een Verfpomp die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedVerfpomp != null)

                if (SelectedVerfpomp.stamkaart == null)
                    MessageBox.Show("Deze Verfpomp heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedVerfpomp.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een Verfpomp waarvan u de stamkaart wilt openen");

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Verfpompen = context.Verfpomp.ToList();
                _allVerfpompen = context.Verfpomp.ToList();

            }

            RaisePropertyChanged("Verfpompen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddVerfpompView());
        }

        public void openEditWindow()
        {
            if (SelectedVerfpomp != null)
                Navigator.SetNewView(new EditVerfpompView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een verfpomp die u wilt wijzigen");
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
