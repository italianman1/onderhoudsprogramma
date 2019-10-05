using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Algemeen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Algemeen
{
    public class AlgemeenOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<AlgemeenItem> _allAlgemeenItems;
        private List<AlgemeenItem> _Algemeen;
        private string _searchString = "Zoek hier op code nummer";

        public AlgemeenOverzichtViewModel()
        {
            List<AlgemeenItem> searchedAlgemeen;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Algemeen = context.AlgemeenItem.ToList();

                searchedAlgemeen = Algemeen;

                _allAlgemeenItems = searchedAlgemeen;
                _Algemeen = searchedAlgemeen;



                List<string> Algemeen_keuring = new List<string>();

                foreach (var item in _allAlgemeenItems)
                {
                    if (item.datum_herkeuring < DateTime.Today)
                    {
                        Algemeen_keuring.Add(item.benaming + ", Datum herkeuring: " + item.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Algemeen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen algemene items die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Algemeen_keuring);

                    MessageBox.Show("Deze algemene items moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteAlgemeenCommand = new RelayCommand(deleteAlgemeen, canDelete);
            AddAlgemeenCommand = new RelayCommand(openAddWindow);
            EditAlgemeenCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            OpenOHCertificateCommand = new RelayCommand(openOHCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteAlgemeenCommand { get; set; }
        public ICommand AddAlgemeenCommand { get; set; }
        public ICommand EditAlgemeenCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand OpenOHCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<AlgemeenItem> Algemeen
        {
            get
            {
                return _Algemeen;
            }

            set
            {
                _Algemeen = value;
                RaisePropertyChanged("Algemeen");
            }
        }


        public AlgemeenItem SelectedAlgemeen { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedAlgemeen = new List<AlgemeenItem>();

                foreach (var item in _allAlgemeenItems)
                    if ((_searchString != null) && item.code_nr.ToLower().Contains(SearchString))
                    {
                        searchedAlgemeen.Add(item);
                    }


                _Algemeen = searchedAlgemeen;

                RaisePropertyChanged("Algemeen");
            }
        }

        public void deleteAlgemeen()
        {
            if (SelectedAlgemeen != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze Algemeen wilt verwijderen?", "Verwijder " + SelectedAlgemeen.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var AlgemeenItems = context.AlgemeenItem.ToList();

                        foreach (var item in AlgemeenItems)
                            if (item.Id == SelectedAlgemeen.Id)
                                context.AlgemeenItem.Remove(item);
                        context.SaveChanges();


                        _Algemeen = context.AlgemeenItem.ToList();
                        _allAlgemeenItems = context.AlgemeenItem.ToList();
                    }


                    RaisePropertyChanged("Algemeen");
                }
                else if (dialogResult == MessageBoxResult.No)
                {

                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een Algemeen die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedAlgemeen != null)

                if (SelectedAlgemeen.stamkaart == null)
                    MessageBox.Show("Deze Algemeen heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedAlgemeen.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een Algemeen waarvan u de stamkaart wilt openen");

        }

        public void openOHCertificate()
        {

            try
            {
                System.Diagnostics.Process.Start("M:\\Certificaten onderhoudsprogramma\\Algemeen\\Keuringsrapport overheaddeuren.pdf");
            }

            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Algemeen = context.AlgemeenItem.ToList();
                _allAlgemeenItems = context.AlgemeenItem.ToList();

            }

            RaisePropertyChanged("Algemeen");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddAlgemeenView());
        }

        public void openEditWindow()
        {
            if (SelectedAlgemeen != null)
                Navigator.SetNewView(new EditAlgemeenView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een Algemeen die u wilt wijzigen");
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
