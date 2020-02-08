using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Valbeveiliging;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Input;

namespace Lammers.ViewModel.Valbeveiligingen
{
    public class EditValbeveiligingViewModel
    {
        private List<string> _personen;
        private List<string> _omschrijvingen;
        private string _selectedPersoon;
        private string _selectedOmschrijving;
        private string _certificaat;
        private string _filetext;
        private string _opdrnr;
        private string _certinr;
        private string _serienr;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private Valbeveiliging _currentValbeveiliging;
        private ValbeveiligingsOverzichtViewModel _valover;
        public ICommand EditValbeveiliging { get; set; }
        public ICommand BackCommand { get; set; }
        public ICommand ChooseCertificate { get; set; }

        public EditValbeveiligingViewModel(Valbeveiliging currentValbeveiliging, ValbeveiligingsOverzichtViewModel valover)
        {
            _personen = new List<string>();
            _personen.Add("Simon");
            _personen.Add("Ronnie");
            _personen.Add("Rob Maas");
            _personen.Add("Roy Geven");
            _personen.Add("Wim Slenders");
            _personen.Add("Jeffrey");
            _personen.Add("Jeroen van Deurzen");
            _personen.Add("Jelle Kwant");
            _personen.Add("Henk (nieuwe monteur)");
            _personen.Add("Magazijn");
            _personen.Add("Onbekend");


            _omschrijvingen = new List<string>();
            _omschrijvingen.Add("Positielijn");
            _omschrijvingen.Add("Harnas");
            _omschrijvingen.Add("Vallijn met demper");
            _omschrijvingen.Add("Valstopapparaat");
            _omschrijvingen.Add("Vallijn");
            _omschrijvingen.Add("Rugbandje");
            _omschrijvingen.Add("Verstelbare horizontale werklijn");

            Personen = new ObservableCollection<string>(_personen);
            Omschrijvingen = new ObservableCollection<string>(_omschrijvingen);
            EditValbeveiliging = new RelayCommand(editValbeveiliging);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _currentValbeveiliging = currentValbeveiliging;
            _valover = valover;
            SelectedPersoon = _currentValbeveiliging.persoon;
            SelectedOmschrijving = _currentValbeveiliging.omschrijving;
            Certificaatnummer = _currentValbeveiliging.certi_nr;
            Opdrachtnummer = _currentValbeveiliging.opdr_nr;
            Serienummer = _currentValbeveiliging.serie_nr;
            Keuringdatum = (DateTime)_currentValbeveiliging.datum_gekeurd;
            Herkeuringsdatum = (DateTime)_currentValbeveiliging.datum_herkeuring;
            Certificaat = _currentValbeveiliging.certificaat;

            if (currentValbeveiliging.certificaat == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = currentValbeveiliging.certificaat;
            }


        }

        public ObservableCollection<string> Personen { get; set; }

        public string SelectedPersoon
        {
            get
            {
                return _selectedPersoon;
            }

            set
            {
                _selectedPersoon = value;
                RaisePropertyChanged("SelectedPersoon");
            }
        }

        public ObservableCollection<string> Omschrijvingen { get; set; }

        public string SelectedOmschrijving
        {
            get
            {
                return _selectedOmschrijving;
            }

            set
            {
                _selectedOmschrijving = value;
                RaisePropertyChanged("SelectedOmschrijving");
            }
        }


        public string Opdrachtnummer
        {
            get
            {
                return _opdrnr;
            }

            set
            {
                _opdrnr = value;
                RaisePropertyChanged("Opdrachtnummer");
            }
        }

        public string Certificaatnummer
        {
            get
            {
                return _certinr;
            }

            set
            {
                _certinr = value;
                RaisePropertyChanged("Certificaatnummer");
            }
        }

        public DateTime Keuringdatum
        {
            get
            {
                return _keuringDatum;
            }

            set
            {
                _keuringDatum = value;
                RaisePropertyChanged("Keuringdatum");
            }
        }

        public DateTime Herkeuringsdatum
        {
            get
            {
                return _herkeuringsDatum;
            }

            set
            {
                _herkeuringsDatum = value;
                RaisePropertyChanged("Herkeuringsdatum");
            }
        }

        public string Serienummer
        {
            get
            {
                return _serienr;
            }

            set
            {
                _serienr = value;
                RaisePropertyChanged("Serienummer");
            }
        }

        public String Certificaat
        {
            get
            {
                return _certificaat;
            }

            set
            {
                _certificaat = value;
                RaisePropertyChanged("Certificaat");
            }
        }

        public String fileText
        {
            get
            {
                return _filetext;
            }

            set
            {
                _filetext = value;
                RaisePropertyChanged("fileText");
            }
        }



        private void editValbeveiliging()
        {

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het hijsmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Valbeveiliging> allValbeveiliging = context.Valbeveiliging.ToList();
                    bool canEdit= true;

                    foreach (var valbeveiliging in allValbeveiliging)
                    {
                        if (valbeveiliging.serie_nr != null && !(valbeveiliging.Id == _currentValbeveiliging.Id) && valbeveiliging.serie_nr == Serienummer)
                        {
                            MessageBox.Show("Een ander hijsmiddel heeft hetzelfde serienummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                        else if (valbeveiliging.opdr_nr != null && !(valbeveiliging.Id == _currentValbeveiliging.Id) && valbeveiliging.opdr_nr == Opdrachtnummer)
                        {
                            MessageBox.Show("Een ander hijsmiddel heeft hetzelfde opdrachtnummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                        else if (valbeveiliging.certi_nr != null && !(valbeveiliging.Id == _currentValbeveiliging.Id) && valbeveiliging.certi_nr == Certificaatnummer)
                        {
                            MessageBox.Show("Een ander hijsmiddel heeft hetzelfde certificaatnummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                    }

                    if (canEdit)
                    {

                    foreach(var valbeveiliging in allValbeveiliging)
                        {
                            if(valbeveiliging.Id == _currentValbeveiliging.Id)
                            {
                                valbeveiliging.omschrijving = SelectedOmschrijving;
                                valbeveiliging.certi_nr = Certificaatnummer;
                                valbeveiliging.opdr_nr = Opdrachtnummer;
                                valbeveiliging.serie_nr = Serienummer;
                                valbeveiliging.datum_gekeurd = Keuringdatum;
                                valbeveiliging.datum_herkeuring = Herkeuringsdatum;
                                valbeveiliging.persoon = SelectedPersoon;
                                valbeveiliging.certificaat = Certificaat;
                            }
                        }

                        context.SaveChanges();


                        MessageBox.Show("uw valbeveilingsitem is succesvol aangepast!");
                        _valover.updateLists();
                        Navigator.SetNewView(new ValbeveiligingsOverzichtView());
                    }

                }
            }



        }

        private void chooseCertificate()
        {
            Stream myStream = null;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.InitialDirectory = "c:\\";

            openFileDialog1.Filter = "pdf files (*.pdf)|*.pdf|All files (*.*)|*.*";
            openFileDialog1.FilterIndex = 1;
            openFileDialog1.RestoreDirectory = true;

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    if ((myStream = openFileDialog1.OpenFile()) != null)
                    {
                        System.IO.FileInfo fInfo = new System.IO.FileInfo(openFileDialog1.FileName);
                        string strFilePath = fInfo.FullName;
                        Certificaat = strFilePath;
                        fileText = strFilePath;

                    }
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        private void PerformBack()
        {
            Navigator.Back();
        }

        private void RaisePropertyChanged(string prop)
        {
            if (PropertyChanged != null) PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
