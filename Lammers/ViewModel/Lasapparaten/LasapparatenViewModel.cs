using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Lasapparaten;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Lasapparaten
{
    public class LasapparatenViewModel : INotifyPropertyChanged
    {
        public ICommand BackCommand { get; set; }
        private List<Lasapparaat> _allLasapparaten;
        private List<Lasapparaat> _lasapparaten;
        private string _searchString;
        private bool _lammersFilter;
        private bool _stevensFilter;

        public LasapparatenViewModel()
        {
            List<Lasapparaat> searchedLasapparaten;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var lasapparaten = context.Lasapparaat.ToList();

                searchedLasapparaten = lasapparaten;

                _allLasapparaten = searchedLasapparaten;
                _lasapparaten = searchedLasapparaten;
               


                List<string> lasapparaten_keuring = new List<string>();

                foreach (var lasapparaat in _allLasapparaten)
                {
                    if (lasapparaat.datum_herkeuring < DateTime.Today)
                    {
                        lasapparaten_keuring.Add(lasapparaat.benaming + " LAM " + lasapparaat.LAM_nr + ", Datum herkeuring: " + lasapparaat.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (lasapparaten_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen lasapparaten die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, lasapparaten_keuring);

                    MessageBox.Show("Deze lasapparaten moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteLasapparaatCommand = new RelayCommand(deleteLasapparaat, canDelete);
            AddLasapparaatCommand = new RelayCommand(openAddWindow);
            EditLasapparaatCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            FilterCommand = new RelayCommand(filterLasapparaten);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteLasapparaatCommand { get; set; }
        public ICommand AddLasapparaatCommand { get; set; }
        public ICommand EditLasapparaatCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand FilterCommand { get; set; }

        public List<Lasapparaat> Lasapparaten
        {
            get
            {
                return _lasapparaten;
            }

            set
            {
                _lasapparaten = value;
                RaisePropertyChanged("Lasapparaten");
            }
        }


        public Lasapparaat SelectedLasapparaat { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                filterLasapparaten();

                RaisePropertyChanged("Lasapparaten");
            }
        }

        public bool StevensFilter
        {
            get { return _stevensFilter; }

            set
            {
                _stevensFilter = value;

                RaisePropertyChanged("StevensFilter");
            }
        }

        public bool LammersFilter
        {
            get { return _lammersFilter; }

            set
            {
                _lammersFilter = value;

                RaisePropertyChanged("LammersFilter");
            }
        }

        public void deleteLasapparaat()
        {
            if (SelectedLasapparaat != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u dit lasapparaat wilt verwijderen?", "Verwijder " + SelectedLasapparaat.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var lasapparaten = context.Lasapparaat.ToList();

                        foreach (var lasapparaat in lasapparaten)
                            if (lasapparaat.Id == SelectedLasapparaat.Id)
                                context.Lasapparaat.Remove(lasapparaat);
                        context.SaveChanges();


                        _lasapparaten = context.Lasapparaat.ToList();
                        _allLasapparaten = context.Lasapparaat.ToList();
                    }


                    RaisePropertyChanged("Lasapparaten");
                }
                else if (dialogResult == MessageBoxResult.No)
                {
                    
                }
               
            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een valbeveiliging item wat u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedLasapparaat != null)

                if (SelectedLasapparaat.stamkaart == null)
                    MessageBox.Show("Dit lasapparaat heeft geen bijgevoegd stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedLasapparaat.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een lasapparaat waarvan u het stamkaart wilt openen");

        }

        public void filterLasapparaten()
        {
            var searchedLasapparaten = new List<Lasapparaat>();

            if (StevensFilter && LammersFilter)
            {
                foreach (var lasapparaat in _allLasapparaten)
                    if ((_searchString != null) && lasapparaat.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedLasapparaten.Add(lasapparaat);
                    }

                Lasapparaten = searchedLasapparaten;
            }

            if (StevensFilter && !LammersFilter)
            {
                foreach (var lasapparaat in _allLasapparaten)
                    if ((bool)lasapparaat.stevens && (_searchString != null) && lasapparaat.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedLasapparaten.Add(lasapparaat);
                    }

                Lasapparaten = searchedLasapparaten;

            }

            if (!StevensFilter && LammersFilter)
            {
                foreach (var lasapparaat in _allLasapparaten)
                    if (!(bool)lasapparaat.stevens && (_searchString != null) && lasapparaat.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedLasapparaten.Add(lasapparaat);
                    }

                Lasapparaten = searchedLasapparaten;

            }

            if (!StevensFilter && !LammersFilter)
            {
                foreach (var lasapparaat in _allLasapparaten)
                    if ((_searchString != null) && lasapparaat.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedLasapparaten.Add(lasapparaat);
                    }

                Lasapparaten = searchedLasapparaten;

            }
        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Lasapparaten = context.Lasapparaat.ToList();
                _allLasapparaten = context.Lasapparaat.ToList();

            }

            RaisePropertyChanged("Lasapparaten");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddLasapparaatView());
        }

        public void openEditWindow()
        {
            if (SelectedLasapparaat != null)
                Navigator.SetNewView(new EditLasapparaatView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een lasmiddel wat u wilt wijzigen");
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
