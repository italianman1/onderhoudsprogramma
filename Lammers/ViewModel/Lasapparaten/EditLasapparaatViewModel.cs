using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Lasapparaten;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace Lammers.ViewModel.Lasapparaten
{
   public class EditLasapparaatViewModel
    {
        private List<string> _locaties;
        private string _selectedLocatie;
        private int _LAMnr;
        private string _codenr;
        private string _benaming;
        private string _leverancier;
        private string _merk;
        private string _certificaat;
        private string _filetext;
        private bool _stevensLasbedrijf;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private int _bouwjaar;
        private LasapparatenViewModel LasapparaatOver;
        private Lasapparaat SelectedLasapparaat;
        public ICommand EditLasapparaat { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public EditLasapparaatViewModel(LasapparatenViewModel las)
        {
            _locaties = new List<string>();
            _locaties.Add("Hal 1");
            _locaties.Add("Hal 2");
            SelectedLasapparaat = las.SelectedLasapparaat;
            Locaties = new ObservableCollection<string>(_locaties);
            EditLasapparaat = new RelayCommand(editLasapparaat);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            Herkeuringsdatum = (DateTime)SelectedLasapparaat.datum_herkeuring;
            Keuringdatum = (DateTime)SelectedLasapparaat.datum_gekeurd;
            Bouwjaar = (int)SelectedLasapparaat.bouwjaar;
            Benaming = SelectedLasapparaat.benaming;
            LAM_nummer = (int)SelectedLasapparaat.LAM_nr;
            Codenummer = SelectedLasapparaat.code_nr;
            SelectedLocatie = SelectedLasapparaat.locatie;
            Leverancier = SelectedLasapparaat.leverancier;
            Certificaat = SelectedLasapparaat.stamkaart;
            Stevens = (bool)SelectedLasapparaat.stevens;
            Merk = SelectedLasapparaat.merk;
            LasapparaatOver = las;


            if (SelectedLasapparaat.stamkaart == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = SelectedLasapparaat.stamkaart;
            }

        }

        public ObservableCollection<string> Locaties { get; set; }

        public string SelectedLocatie
        {
            get
            {
                return _selectedLocatie;
            }

            set
            {
                _selectedLocatie = value;
                RaisePropertyChanged("SelectedLocatie");
            }
        }


        public int LAM_nummer
        {
            get
            {
                return _LAMnr;
            }

            set
            {
                _LAMnr = value;
                RaisePropertyChanged("LAM_nummer");
            }
        }

        public string Codenummer
        {
            get
            {
                return _codenr;
            }

            set
            {
                _codenr = value;
                RaisePropertyChanged("Codenummer");
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

        public string Benaming
        {
            get
            {
                return _benaming;
            }

            set
            {
                _benaming = value;
                RaisePropertyChanged("Benaming");
            }
        }

        public string Leverancier
        {
            get
            {
                return _leverancier;
            }

            set
            {
                _leverancier = value;
                RaisePropertyChanged("Leverancier");
            }
        }

        public string Merk
        {
            get
            {
                return _merk;
            }

            set
            {
                _merk = value;
                RaisePropertyChanged("Merk");
            }
        }

        public int Bouwjaar
        {
            get
            {
                return _bouwjaar;
            }

            set
            {
                _bouwjaar = value;
                RaisePropertyChanged("Bouwjaar");
            }
        }

        public bool Stevens
        {
            get
            {
                return _stevensLasbedrijf;
            }

            set
            {
                _stevensLasbedrijf = value;
                RaisePropertyChanged("Stevens");
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




        private void editLasapparaat()
        {

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het hijsmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Lasapparaat> allLasapparaten = context.Lasapparaat.ToList();
                    bool canEdit = true;

                    foreach (var lasapparaat in allLasapparaten)
                    {
                        if (lasapparaat.LAM_nr != null && !(lasapparaat.Id == SelectedLasapparaat.Id) && lasapparaat.LAM_nr == LAM_nummer)
                        {
                            MessageBox.Show("Een ander lasapparaat heeft hetzelfde LAM-nummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                        else if (lasapparaat.code_nr != null && !(lasapparaat.Id == SelectedLasapparaat.Id) && lasapparaat.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een ander lasapparaat heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                    }

                    if (canEdit)
                    {
                        foreach(var lasapparaat in allLasapparaten)
                        {
                            if(lasapparaat.Id == SelectedLasapparaat.Id)
                            {
                                lasapparaat.benaming = Benaming;
                                lasapparaat.merk = Merk;
                                lasapparaat.LAM_nr = LAM_nummer;
                                lasapparaat.code_nr = Codenummer;
                                lasapparaat.datum_gekeurd = Keuringdatum;
                                lasapparaat.datum_herkeuring = Herkeuringsdatum;
                                lasapparaat.leverancier = Leverancier;
                                lasapparaat.bouwjaar = Bouwjaar;
                                lasapparaat.locatie = SelectedLocatie;
                                lasapparaat.stamkaart = Certificaat;
                                lasapparaat.stevens = Stevens;
                            }
                        }
                      
                       
                        context.SaveChanges();


                        MessageBox.Show("uw lasapparaat is succesvol aangepast!");
                        LasapparaatOver.updateLists();
                        Navigator.SetNewView(new LasapparatenView());
                    }

                }
            }



        }

        private void chooseCertificate()
        {
            Stream myStream = null;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.InitialDirectory = "c:\\";

            openFileDialog1.Filter = "All files (*.*)|*.*|word files (*.docx)|*.docx|(*.doc)|*.doc"; ;
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

