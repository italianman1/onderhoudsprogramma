using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Algemeen;
using Lammers.ViewModel.Algemeen;
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

namespace Lammers.ViewModel.Algemeen
{
   public class AddAlgemeenViewModel
    {
        private int _bouwjaar;
        private string _benaming;
        private string _merk;
        private string _leverancier;
        private string _codeNummer;
        private string _certificaat;
        private string _filetext;
        private int lam_nummer;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private AlgemeenOverzichtViewModel AlgemeenOver;
        public ICommand AddAlgemeen { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public AddAlgemeenViewModel(AlgemeenOverzichtViewModel alg)
        {

            AddAlgemeen = new RelayCommand(addAlgemeen);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            AlgemeenOver = alg;

            fileText = "Blader...";

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

        public string Codenummer
        {
            get
            {
                return _codeNummer;
            }

            set
            {
                _codeNummer = value;
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


        private void addAlgemeen()
        {

            bool canAdd = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het Algemeen gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<AlgemeenItem> allAlgemeen = context.AlgemeenItem.ToList();

                    foreach (var Algemeen in allAlgemeen)
                    {  
                        if (Algemeen.code_nr != null && Algemeen.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een ander item heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canAdd = false;
                            break;
                        }
                    }



                    if (canAdd)
                    {
                        var newAlgemeenitem = new AlgemeenItem
                        {
                            benaming = Benaming,
                            bouwjaar = Bouwjaar,
                            code_nr = Codenummer,
                            leverancier = Leverancier,
                            datum_gekeurd = Keuringdatum,
                            datum_herkeuring = Herkeuringsdatum,
                            stamkaart = Certificaat,
                            datum_laatst_aangepast = DateTime.Now                          
                        };

                        context.AlgemeenItem.Add(newAlgemeenitem);
                        context.SaveChanges();


                        MessageBox.Show("uw Algemeen is succesvol aangemaakt!");
                        AlgemeenOver.updateLists();
                        Navigator.SetNewView(new AlgemeenOverzichtView());
                    }
                }
            }




        }

        private void chooseCertificate()
        {
            Stream myStream = null;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();

            openFileDialog1.InitialDirectory = "c:\\";
            openFileDialog1.Filter = "All files (*.*)|*.*|word files (*.docx)|*.docx|(*.doc)|*.doc";
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

