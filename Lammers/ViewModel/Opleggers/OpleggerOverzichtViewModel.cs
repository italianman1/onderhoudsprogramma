using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Opleggers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Opleggers
{
    public class OpleggerOverzichtViewModel : INotifyPropertyChanged
    {

        private List<Oplegger> _allOpleggers;
        private List<Oplegger> _opleggers;
        private string _searchString = "Zoek hier op benaming";

        public OpleggerOverzichtViewModel()
        {
            List<Oplegger> searchedOpleggers;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var opleggers = context.Oplegger.ToList();

                searchedOpleggers = opleggers;
                _allOpleggers = searchedOpleggers;
                _opleggers = searchedOpleggers;

                List<string> opleggers_keuring = new List<string>();

                foreach (var oplegger in _allOpleggers)
                {
                    if (oplegger.datum_herkeuring < DateTime.Today && !oplegger.status.Equals("Geschorst") && !oplegger.status.Equals("Certificaat onderweg") && !oplegger.status.Equals("Niet meer in gebruik"))
                    {
                        opleggers_keuring.Add(oplegger.benaming + "(" + oplegger.kenteken + "), Datum herkeuring: " + oplegger.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (opleggers_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen opleggers die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, opleggers_keuring);

                    MessageBox.Show("Deze opleggers moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

          
            DeleteOpleggerCommand = new RelayCommand(deleteOplegger, canDelete);
            AddOpleggerCommand = new RelayCommand(openAddWindow);
            EditOpleggerCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteOpleggerCommand { get; set; }
        public ICommand AddOpleggerCommand { get; set; }
        public ICommand EditOpleggerCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Oplegger> Opleggers
        {
            get
            {
                return _opleggers;
            }

            set
            {
                _opleggers = value;
                RaisePropertyChanged("Opleggers");
            }
        }


        public Oplegger SelectedOplegger { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedOpleggers = new List<Oplegger>();

                foreach (var oplegger in _allOpleggers)
                    if ((_searchString != null) && oplegger.kenteken.ToLower().Contains(SearchString.ToLower()))
                    {
                        searchedOpleggers.Add(oplegger);
                    }


                _opleggers = searchedOpleggers;

                RaisePropertyChanged("Opleggers");
            }
        }

        public void deleteOplegger()
        {
            if (SelectedOplegger != null)
            {
                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze oplegger wilt verwijderen?", "Verwijder " + SelectedOplegger.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var opleggers = context.Oplegger.ToList();

                        foreach (var oplegger in opleggers)
                            if (oplegger.Id == SelectedOplegger.Id)
                                context.Oplegger.Remove(oplegger);
                        context.SaveChanges();


                        _opleggers = context.Oplegger.ToList();
                        _allOpleggers = context.Oplegger.ToList();
                    }


                    RaisePropertyChanged("Opleggers");
                }
                    
            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een oplegger die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedOplegger != null)

                if (SelectedOplegger.stamkaart == null)
                    MessageBox.Show("Deze oplegger heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedOplegger.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een lasapparaat waarvan u het stamkaart wilt openen");

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Opleggers = context.Oplegger.ToList();
                _allOpleggers = context.Oplegger.ToList();

            }

            RaisePropertyChanged("Opleggers");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddOpleggerView());
        }

        public void openEditWindow()
        {
            if (SelectedOplegger != null)
                Navigator.SetNewView(new EditOpleggerView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een oplegger die u wilt wijzigen");
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
