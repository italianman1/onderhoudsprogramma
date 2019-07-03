using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Hijsmiddelen;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;


namespace Lammers.ViewModel.Hijsmiddelen
{
   
    public class HijsmiddelenViewModel : INotifyPropertyChanged
    {
        public ICommand BackCommand { get; set; }
        private List<Hijsmiddel> _allHijsmiddelen;
        private List<Hijsmiddel> _hijsmiddelen;
        private string _searchString;
        private bool _lammersFilter;
        private bool _stevensFilter;

        public HijsmiddelenViewModel()
        {
            List<Hijsmiddel> searchedHijsmiddelen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var hijsmiddelen = context.Hijsmiddel.ToList();

                searchedHijsmiddelen = hijsmiddelen;

                List<Hijsmiddel> allHijsmiddelen = context.Hijsmiddel.ToList();

                _allHijsmiddelen = searchedHijsmiddelen;
                _hijsmiddelen = searchedHijsmiddelen;
                DeleteHijsmiddelCommand = new RelayCommand(deleteHijsmiddel, canDelete);
                AddHijsmiddelCommand = new RelayCommand(openAddWindow);
                EditHijsmiddelCommand = new RelayCommand(openEditWindow);
                OpenCertificateCommand = new RelayCommand(openCertificate);
                FilterCommand = new RelayCommand(filterHijsmiddelen);
                BackCommand = new RelayCommand(PerformBack);

            }
        }

        public ICommand DeleteHijsmiddelCommand { get; set; }
        public ICommand AddHijsmiddelCommand { get; set; }
        public ICommand EditHijsmiddelCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand FilterCommand { get; set; }

        public List<Hijsmiddel> Hijsmiddelen
        {
            get
            {
                return _hijsmiddelen;
            }

            set
            {
                _hijsmiddelen = value;
                RaisePropertyChanged("Hijsmiddelen");
            }
        }


        public Hijsmiddel SelectedHijsmiddel { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;
     
                filterHijsmiddelen();

                RaisePropertyChanged("Hijsmiddelen");

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

        public void deleteHijsmiddel()
        {
            if (SelectedHijsmiddel != null)
            {
                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u dit hijsmiddel wilt verwijderen?", "Verwijder " + SelectedHijsmiddel.soort +"(" + SelectedHijsmiddel.reg_nr + ")", MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var hijsmiddelen = context.Hijsmiddel.ToList();

                        foreach (var hijsmiddel in hijsmiddelen)
                            if (hijsmiddel.Id == SelectedHijsmiddel.Id)
                                context.Hijsmiddel.Remove(hijsmiddel);
                        context.SaveChanges();


                        _hijsmiddelen = context.Hijsmiddel.ToList();
                        _allHijsmiddelen = context.Hijsmiddel.ToList();
                    }


                    RaisePropertyChanged("Hijsmiddelen");
                }
                   
            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een valbeveiliging item wat u wilt verwijderen");
            }
                
        }

        public void filterHijsmiddelen()
        {
            var searchedHijsmiddelen = new List<Hijsmiddel>();

            if (StevensFilter && LammersFilter)
            {
                foreach (var hijsmiddel in _allHijsmiddelen)
                    if ((_searchString != null) && hijsmiddel.reg_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedHijsmiddelen.Add(hijsmiddel);
                    }
 
                Hijsmiddelen = searchedHijsmiddelen;
            }

            if(StevensFilter && !LammersFilter)
            {
                foreach (var hijsmiddel in _allHijsmiddelen)
                    if ((bool)hijsmiddel.stevens && (_searchString != null) && hijsmiddel.reg_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedHijsmiddelen.Add(hijsmiddel);
                    }

                Hijsmiddelen = searchedHijsmiddelen;

            }

            if (!StevensFilter && LammersFilter)
            {
                foreach (var hijsmiddel in _allHijsmiddelen)
                    if (!(bool)hijsmiddel.stevens && (_searchString != null) && hijsmiddel.reg_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedHijsmiddelen.Add(hijsmiddel);
                    }

                Hijsmiddelen = searchedHijsmiddelen;

            }

            if (!StevensFilter && !LammersFilter)
            {
                foreach (var hijsmiddel in _allHijsmiddelen)
                    if ((_searchString != null) && hijsmiddel.reg_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedHijsmiddelen.Add(hijsmiddel);
                    }
                Hijsmiddelen = searchedHijsmiddelen;

            }
        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Hijsmiddelen = context.Hijsmiddel.ToList();
                _allHijsmiddelen = context.Hijsmiddel.ToList();

            }
                
            RaisePropertyChanged("Hijsmiddelen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openCertificate()
        {
            if (SelectedHijsmiddel != null)
               
                if (SelectedHijsmiddel.certificaat == null)
                    MessageBox.Show("Dit hijsmiddel heeft geen bijgevoegd certificaat");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedHijsmiddel.certificaat);
                    }

                    catch(Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }
                
                

            else
                MessageBox.Show("Selecteer alstublieft eerst een hijsmiddel waarvan u het certificaat wilt openen");
            
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddHijsmiddelView());
        }

        public void openEditWindow()
        {
            if (SelectedHijsmiddel != null)
                Navigator.SetNewView(new EditHijsmiddelView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een hijsmiddel wat u wilt wijzigen");
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
