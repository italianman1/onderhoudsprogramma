using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Kranen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Kranen
{
   public class KranenOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<Bovenloopkraan> _allKranen;
        private List<Bovenloopkraan> _kranen;
        private string _searchString;
        private bool _lammersFilter;
        private bool _stevensFilter;


        public KranenOverzichtViewModel()
        {
            List<Bovenloopkraan> searchedKranen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var kranen = context.Bovenloopkraan.ToList();

                searchedKranen = kranen;


                List<Bovenloopkraan> allKranen = context.Bovenloopkraan.ToList();
                List<string> kranen_keuring = new List<string>();
                foreach (var kraan in allKranen)
                {
                    if (kraan.datum_herkeuring < DateTime.Today)
                    {
                        kranen_keuring.Add(kraan.benaming + ", Datum herkeuring: " + kraan.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if(kranen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen kranen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, kranen_keuring);

                    MessageBox.Show("Deze kranen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            _allKranen = searchedKranen;
            _kranen = searchedKranen;
            DeleteKraanCommand = new RelayCommand(deleteKraan, canDelete);
            AddKraanCommand = new RelayCommand(openAddWindow);
            EditKraanCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            FilterCommand = new RelayCommand(filterKranen);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteKraanCommand { get; set; }
        public ICommand AddKraanCommand { get; set; }
        public ICommand EditKraanCommand { get; set; }
        public ICommand BackCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand FilterCommand { get; set; }

        public List<Bovenloopkraan> Kranen
        {
            get
            {
                return _kranen;
            }

            set
            {
                _kranen = value;
                RaisePropertyChanged("Kranen");
            }
        }


        public Bovenloopkraan SelectedKraan { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;

                filterKranen();

                RaisePropertyChanged("Kranen");
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

        public void deleteKraan()
        {
            if (SelectedKraan != null)
            {
                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze kraan wilt verwijderen?", "Verwijder " + SelectedKraan.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var kranen = context.Bovenloopkraan.ToList();

                        foreach (var kraan in kranen)
                            if (kraan.Id == SelectedKraan.Id)
                                context.Bovenloopkraan.Remove(kraan);
                        context.SaveChanges();


                        _kranen = context.Bovenloopkraan.ToList();
                        _allKranen = context.Bovenloopkraan.ToList();
                    }


                    RaisePropertyChanged("Kranen");
                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een kraan die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedKraan != null)

                if (SelectedKraan.stamkaart == null)
                    MessageBox.Show("Deze kraan heeft geen bijgevoegd stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedKraan.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een kraan waarvan u het stamkaart wilt openen");

        }


        public void filterKranen()
        {
            var searchedKranen = new List<Bovenloopkraan>();

            if (StevensFilter && LammersFilter)
            {
                foreach (var kraan in _allKranen)
                    if ((_searchString != null) && kraan.benaming.ToString().ToLower().Contains(SearchString))
                    {
                        searchedKranen.Add(kraan);
                    }

                Kranen = searchedKranen;
            }

            if (StevensFilter && !LammersFilter)
            {
                foreach (var kraan in _allKranen)
                    if ((bool)kraan.stevens && (_searchString != null) && kraan.benaming.ToString().ToLower().Contains(SearchString))
                    {
                        searchedKranen.Add(kraan);
                    }

                Kranen = searchedKranen;

            }

            if (!StevensFilter && LammersFilter)
            {
                foreach (var kraan in _allKranen)
                    if (!(bool)kraan.stevens && (_searchString != null) && kraan.benaming.ToString().ToLower().Contains(SearchString))
                    {
                        searchedKranen.Add(kraan);
                    }

                Kranen = searchedKranen;

            }

            if (!StevensFilter && !LammersFilter)
            {
                foreach (var kraan in _allKranen)
                    if ((_searchString != null) && kraan.benaming.ToString().ToLower().Contains(SearchString))
                    {
                        searchedKranen.Add(kraan);
                    }

                Kranen = searchedKranen;

            }
        }


        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Kranen = context.Bovenloopkraan.ToList();
                _allKranen = context.Bovenloopkraan.ToList();

            }

            RaisePropertyChanged("Kranen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddKraanView());
        }

        public void openEditWindow()
        {
            if (SelectedKraan != null)
                Navigator.SetNewView(new EditKraanView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een kraan die u wilt wijzigen");
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
