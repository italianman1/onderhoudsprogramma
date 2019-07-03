﻿using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Kranen;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace Lammers.ViewModel.Kranen
{
    public class EditKraanViewModel
    {
        private string _codenummer;
        private int _bouwjaar;
        private string _opdrachtnummer;
        private string _locatie;
        private string _leverancier;
        private string _benaming;
        private string _hijsvermogen;
        private string _fabrieksnummer;
        private string _certificaat;
        private string _filetext;
        private bool _stevensLasbedrijf;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private Bovenloopkraan selectedKraan;
        private KranenOverzichtViewModel KraanOver;


        public EditKraanViewModel(KranenOverzichtViewModel kraan)
        {
            EditKraan = new RelayCommand(editKraan);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            KraanOver = kraan;
            selectedKraan = KraanOver.SelectedKraan;
            Codenummer = selectedKraan.code_nr;
            Bouwjaar = (int)selectedKraan.bouwjaar;
            Opdrachtnummer = selectedKraan.opdracht_nr;
            Locatie = selectedKraan.locatie;
            Leverancier = selectedKraan.leverancier;
            Benaming = selectedKraan.benaming;
            Hijsvermogen = selectedKraan.hijsvermogen;
            Fabrieksnummer = selectedKraan.fabrieks_nr;
            Keuringdatum = (DateTime)selectedKraan.datum_gekeurd;
            Herkeuringsdatum = (DateTime)selectedKraan.datum_herkeuring;
            Certificaat = selectedKraan.stamkaart;
            Stevens = (bool)selectedKraan.stevens;

            if (selectedKraan.stamkaart == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = selectedKraan.stamkaart;
            }


        }

        public ICommand EditKraan { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }


        public string Codenummer
        {
            get
            {
                return _codenummer;
            }

            set
            {
                _codenummer = value;
                RaisePropertyChanged("Codenummer");
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

        public string Opdrachtnummer
        {
            get
            {
                return _opdrachtnummer;
            }

            set
            {
                _opdrachtnummer = value;
                RaisePropertyChanged("Opdrachtnummer");
            }
        }

        public string Locatie
        {
            get
            {
                return _locatie;
            }

            set
            {
                _locatie = value;
                RaisePropertyChanged("Locatie");
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

        public string Hijsvermogen
        {
            get
            {
                return _hijsvermogen;
            }

            set
            {
                _hijsvermogen = value;
                RaisePropertyChanged("Hijsvermogen");
            }
        }

        public string Fabrieksnummer
        {
            get
            {
                return _fabrieksnummer;
            }

            set
            {
                _fabrieksnummer = value;
                RaisePropertyChanged("Fabrieksnummer");
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


        private void editKraan()
        {

            bool canEdit = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het hijsmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Bovenloopkraan> allKranen = context.Bovenloopkraan.ToList();

                    foreach (var kraan in allKranen)
                    {
                        if (kraan.Id != selectedKraan.Id && kraan.code_nr != null && kraan.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een andere kraan heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }

                        else if (kraan.Id != selectedKraan.Id && kraan.benaming != null && kraan.benaming.Equals(Benaming))
                        {
                            MessageBox.Show("Een andere kraan heeft dezelfde benaming, verander dit naar een andere unieke benaming aub");
                            canEdit = false;
                            break;
                        }

                        else if (kraan.Id != selectedKraan.Id && kraan.fabrieks_nr != null && kraan.fabrieks_nr.Equals(Fabrieksnummer))
                        {
                            MessageBox.Show("Een andere kraan heeft hetzelfde fabrieksnummer, verander dit naar een ander uniek fabrieksnummer aub");
                            canEdit = false;
                            break;
                        }
                    }



                    if (canEdit)
                    {

                        foreach (var kraan in allKranen)
                        {
                            if(kraan.Id == selectedKraan.Id)
                            {
                                kraan.benaming = Benaming;
                                kraan.leverancier = Leverancier;
                                kraan.bouwjaar = Bouwjaar;
                                kraan.code_nr = Codenummer;
                                kraan.datum_gekeurd = Keuringdatum;
                                kraan.datum_herkeuring = Herkeuringsdatum;
                                kraan.opdracht_nr = Opdrachtnummer;
                                kraan.locatie = Locatie;
                                kraan.fabrieks_nr = Fabrieksnummer;
                                kraan.hijsvermogen = Hijsvermogen;
                                kraan.stamkaart = Certificaat;
                                kraan.stevens = Stevens;
                            }
                        }
                

                        context.SaveChanges();


                        MessageBox.Show("uw kraan is succesvol aangepast!");
                        KraanOver.updateLists();
                        Navigator.SetNewView(new KranenOverzichtView());
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
