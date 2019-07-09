using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Compressoren;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Compressoren
{
    public class CompressorOverzichtViewModel : INotifyPropertyChanged
    {
       
        private List<Compressor> _allCompressoren;
        private List<Compressor> _Compressoren;
        private string _searchString = "Zoek hier op serie nummer";

        public CompressorOverzichtViewModel()
        {
            List<Compressor> searchedCompressoren;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Compressoren = context.Compressor.ToList();

                searchedCompressoren = Compressoren;

                _allCompressoren = searchedCompressoren;
                _Compressoren = searchedCompressoren;



                List<string> Compressoren_keuring = new List<string>();

                foreach (var Compressor in _allCompressoren)
                {
                    if (Compressor.datum_herkeuring < DateTime.Today)
                    {
                        Compressoren_keuring.Add(Compressor.benaming + " " + Compressor.merk + ", Datum herkeuring: " + Compressor.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Compressoren_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen Compressoren die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Compressoren_keuring);

                    MessageBox.Show("Deze Compressoren moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }

            DeleteCompressorCommand = new RelayCommand(deleteCompressor, canDelete);
            AddCompressorCommand = new RelayCommand(openAddWindow);
            EditCompressorCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteCompressorCommand { get; set; }
        public ICommand AddCompressorCommand { get; set; }
        public ICommand EditCompressorCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Compressor> Compressoren
        {
            get
            {
                return _Compressoren;
            }

            set
            {
                _Compressoren = value;
                RaisePropertyChanged("Compressoren");
            }
        }


        public Compressor SelectedCompressor { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedCompressoren = new List<Compressor>();

                foreach (var Compressor in _allCompressoren)
                    if ((_searchString != null) && Compressor.serie_nr.ToLower().Contains(SearchString))
                    {
                        searchedCompressoren.Add(Compressor);
                    }


                _Compressoren = searchedCompressoren;

                RaisePropertyChanged("Compressoren");
            }
        }

        public void deleteCompressor()
        {
            if (SelectedCompressor != null)
            {

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze Compressor wilt verwijderen?", "Verwijder " + SelectedCompressor.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var Compressoren = context.Compressor.ToList();

                        foreach (var Compressor in Compressoren)
                            if (Compressor.Id == SelectedCompressor.Id)
                                context.Compressor.Remove(Compressor);
                        context.SaveChanges();


                        _Compressoren = context.Compressor.ToList();
                        _allCompressoren = context.Compressor.ToList();
                    }


                    RaisePropertyChanged("Compressoren");
                }
                else if (dialogResult == MessageBoxResult.No)
                {

                }

            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een Compressor die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {
            if (SelectedCompressor != null)

                if (SelectedCompressor.stamkaart == null)
                    MessageBox.Show("Deze Compressor heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedCompressor.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }



            else
                MessageBox.Show("Selecteer alstublieft eerst een Compressor waarvan u de stamkaart wilt openen");

        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Compressoren = context.Compressor.ToList();
                _allCompressoren = context.Compressor.ToList();

            }

            RaisePropertyChanged("Compressoren");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddCompressorView());
        }

        public void openEditWindow()
        {
            if (SelectedCompressor != null)
                Navigator.SetNewView(new EditCompressorView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een Compressor die u wilt wijzigen");
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
