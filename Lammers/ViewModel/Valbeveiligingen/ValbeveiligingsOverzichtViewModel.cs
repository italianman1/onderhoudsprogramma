using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Valbeveiliging;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Valbeveiligingen
{
    public class ValbeveiligingsOverzichtViewModel : INotifyPropertyChanged
    {
        public ICommand BackCommand { get; set; }
        public ICommand HomeCommand { get; set; }
        private List<Valbeveiliging> _allValbeveiliging;
        private List<Valbeveiliging> _valbeveiliging;
        private string _searchString = "Zoek hier op opdrachtnummer";

        public ValbeveiligingsOverzichtViewModel()
        {
            List<Valbeveiliging> searchedValbeveiliging = new List<Valbeveiliging>();

            using (var context = new Onderhoud_calibratieEntities())
            {
                var valbeveiligingen = context.Valbeveiliging.ToList();
                searchedValbeveiliging = valbeveiligingen;

            }

            _allValbeveiliging = searchedValbeveiliging;
            _valbeveiliging = searchedValbeveiliging;
            DeleteValbeveiligingCommand = new RelayCommand(deleteValbeveiliging, canDelete);
            AddValbeveiligingCommand = new RelayCommand(openAddWindow);
            EditValbeveiligingCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
            HomeCommand = new RelayCommand(PerformHome);
        }

        public ICommand DeleteValbeveiligingCommand { get; set; }
        public ICommand AddValbeveiligingCommand { get; set; }
        public ICommand EditValbeveiligingCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }

        public List<Valbeveiliging> Valbeveiliging
        {
            get
            {
                return _valbeveiliging;
            }

            set
            {
                _valbeveiliging = value;
                RaisePropertyChanged("Valbeveiliging");
            }
        }


        public Valbeveiliging SelectedValbeveiliging { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedValbeveiliging = new List<Valbeveiliging>();

                foreach (var valbeveiliging in _allValbeveiliging)
                    if ((_searchString != null) && valbeveiliging.opdr_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedValbeveiliging.Add(valbeveiliging);
                    }


                _valbeveiliging = searchedValbeveiliging;

                RaisePropertyChanged("Valbeveiliging");
            }
        }

        public void deleteValbeveiliging()
        {
            if (SelectedValbeveiliging != null)
            {
                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u dit valbeveiligingsitem wilt verwijderen?", "Verwijder " + SelectedValbeveiliging.omschrijving + " van " + SelectedValbeveiliging.persoon, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var valbeveiligingen = context.Valbeveiliging.ToList();
                        if (SelectedValbeveiliging != null)
                        {
                            foreach (var valbeveiliging in valbeveiligingen)
                                if (valbeveiliging.Id == SelectedValbeveiliging.Id)
                                    context.Valbeveiliging.Remove(valbeveiliging);
                            context.SaveChanges();
                        }

                        _valbeveiliging = context.Valbeveiliging.ToList();
                        _allValbeveiliging = context.Valbeveiliging.ToList();
                    }


                    RaisePropertyChanged("Valbeveiliging");
                }
                    
            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een valbeveiliging item wat u wilt verwijderen");
            }

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Valbeveiliging = context.Valbeveiliging.ToList();
                _allValbeveiliging = context.Valbeveiliging.ToList();

            }

            RaisePropertyChanged("Valbeveiliging");
        }

        public void openCertificate()
        {
            if (SelectedValbeveiliging != null)

                if (SelectedValbeveiliging.certificaat == null)
                    MessageBox.Show("Dit valbeveiligingsitem heeft geen bijgevoegd certificaat");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedValbeveiliging.certificaat);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een valbeveiligingsitem waarvan u het certificaat wilt openen");

        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddValbeveiligingView());
        }

        public void openEditWindow()
        {
            if (SelectedValbeveiliging != null)
                Navigator.SetNewView(new EditValbeveiligingView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een valbeveiliging item wat u wilt wijzigen");
        }


        private void PerformBack()
        {
            Navigator.SetNewView(new OverzichtView());
        }

        private void PerformHome()
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
