using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Compressoren;
using Lammers.ViewModel.Compressoren;
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

namespace Lammers.ViewModel.Compressoren
{
   public class AddCompressorViewModel
    {
        private int _bouwjaar;
        private string _benaming;
        private string _merk;
        private string _type;
        private string _leverancier;
        private string _productNummer;
        private string _certificaat;
        private string _filetext;
        private string serie_nr;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private CompressorOverzichtViewModel CompressorOver;
        public ICommand AddCompressor { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public AddCompressorViewModel(CompressorOverzichtViewModel com)
        {

            AddCompressor = new RelayCommand(addCompressor);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            CompressorOver = com;

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

        public string Type
        {
            get
            {
                return _type;
            }

            set
            {
                _type = value;
                RaisePropertyChanged("Type");
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

        public string Productnummer
        {
            get
            {
                return _productNummer;
            }

            set
            {
                _productNummer = value;
                RaisePropertyChanged("Productnummer");
            }
        }

        public string Serienummer
        {
            get
            {
                return serie_nr;
            }

            set
            {
                serie_nr = value;
                RaisePropertyChanged("Serienummer");
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


        private void addCompressor()
        {

            bool canAdd = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop de compressor gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Compressor> allCompressoren = context.Compressor.ToList();

                    foreach (var Compressor in allCompressoren)
                    {
                        if (Compressor.serie_nr != null && Compressor.serie_nr == Serienummer)
                        {
                            MessageBox.Show("Een andere Compressor heeft hetzelfde serie nummer, verander dit naar een ander uniek nummer aub");
                            canAdd = false;
                            break;
                        }

                        else if (Compressor.product_nr != null && Compressor.product_nr == Productnummer)
                        {
                            MessageBox.Show("Een andere Compressor heeft hetzelfde productnummer, verander dit naar een ander uniek nummer aub");
                            canAdd = false;
                            break;
                        }
                    }



                    if (canAdd)
                    {
                        var newCompressor = new Compressor
                        {
                            serie_nr = Serienummer,
                            benaming = Benaming,
                            bouwjaar = Bouwjaar,
                            product_nr = Productnummer,
                            leverancier = Leverancier,
                            datum_gekeurd = Keuringdatum,
                            datum_herkeuring = Herkeuringsdatum,
                            merk = Merk,
                            type = Type,
                            stamkaart = Certificaat,
                            datum_laatst_aangepast = DateTime.Now
                        };

                        context.Compressor.Add(newCompressor);
                        context.SaveChanges();


                        MessageBox.Show("uw Compressor is succesvol aangemaakt!");
                        CompressorOver.updateLists();
                        Navigator.SetNewView(new CompressorOverzichtView());
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

