using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Hefmiddelen;
using Lammers.ViewModel.Hefmiddelen;
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

namespace Lammers.ViewModel.Hefmiddelen
{
    public class EditHefmiddelViewModel
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
        private HefmiddelOverzichtViewModel HefmiddelOver;
        private Hefmiddel selectedHefmiddel;
        public ICommand EditHefmiddel { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public EditHefmiddelViewModel(HefmiddelOverzichtViewModel hef)
        {


            EditHefmiddel = new RelayCommand(editHefmiddel);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            HefmiddelOver = hef;
            selectedHefmiddel = HefmiddelOver.SelectedHefmiddel;
            Herkeuringsdatum = (DateTime)selectedHefmiddel.datum_herkeuring;
            Keuringdatum = (DateTime)selectedHefmiddel.datum_gekeurd;
            Bouwjaar = (int)selectedHefmiddel.bouwjaar;
            Benaming = selectedHefmiddel.benaming;
            LAM_nummer = (int)selectedHefmiddel.LAM_nr;
            Codenummer = selectedHefmiddel.code_nr;
            Leverancier = selectedHefmiddel.leverancier;
            Merk = selectedHefmiddel.merk;
            Certificaat = selectedHefmiddel.stamkaart;


            if (selectedHefmiddel.stamkaart == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = selectedHefmiddel.stamkaart;
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

        public int LAM_nummer
        {
            get
            {
                return lam_nummer;
            }

            set
            {
                lam_nummer = value;
                RaisePropertyChanged("LAM_nummer");
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


        private void editHefmiddel()
        {

            bool canEdit = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het Hefmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Hefmiddel> allHefmiddelen = context.Hefmiddel.ToList();

                    foreach (var Hefmiddel in allHefmiddelen)
                    {
                        if (Hefmiddel.LAM_nr != null && !(Hefmiddel.Id == HefmiddelOver.SelectedHefmiddel.Id) && LAM_nummer != 9999 && Hefmiddel.LAM_nr == LAM_nummer)
                        {
                            MessageBox.Show("Een ander Hefmiddel heeft hetzelfde lam nummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                        else if (Hefmiddel.code_nr != null && !(Hefmiddel.Id == HefmiddelOver.SelectedHefmiddel.Id) && Hefmiddel.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een ander Hefmiddel heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }
                    }

                    if (canEdit)
                    {
                        foreach (var Hefmiddel in allHefmiddelen)
                        {
                            if (Hefmiddel.Id == HefmiddelOver.SelectedHefmiddel.Id)
                            {
                                Hefmiddel.LAM_nr = lam_nummer;
                                Hefmiddel.benaming = Benaming;
                                Hefmiddel.bouwjaar = Bouwjaar;
                                Hefmiddel.code_nr = Codenummer;
                                Hefmiddel.leverancier = Leverancier;
                                Hefmiddel.datum_gekeurd = Keuringdatum;
                                Hefmiddel.datum_herkeuring = Herkeuringsdatum;
                                Hefmiddel.merk = Merk;
                                Hefmiddel.stamkaart = Certificaat;
                                Hefmiddel.datum_laatst_aangepast = DateTime.Now;
                            }
                        }


                        context.SaveChanges();


                        MessageBox.Show("uw Hefmiddel is succesvol aangepast!");
                        HefmiddelOver.updateLists();
                        Navigator.SetNewView(new HefmiddelOverzichtView());
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

