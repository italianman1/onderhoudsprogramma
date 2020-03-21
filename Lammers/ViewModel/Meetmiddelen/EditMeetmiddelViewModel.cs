using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Hefmiddelen;
using Lammers.View.Meetmiddelen;
using Lammers.ViewModel.Meetmiddelen;
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

namespace Lammers.ViewModel.Meetmiddelen
{
    public class EditMeetmiddelViewModel
    {
        private int _bouwjaar;
        private string _benaming;
        private string _merk;
        private string _leverancier;
        private string _codeNummer;
        private string _certificaat;
        private string _filetext;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private MeetmiddelOverzichtViewModel meetOver;
        private Meetmiddel selectedMeetmiddel;
        public ICommand EditMeetmiddel { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public EditMeetmiddelViewModel(MeetmiddelOverzichtViewModel meet)
        {


            EditMeetmiddel = new RelayCommand(editMeetmiddel);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            meetOver = meet;
            selectedMeetmiddel = meet.SelectedMeetmiddel;
            Herkeuringsdatum = (DateTime)selectedMeetmiddel.datum_herkeuring;
            Keuringdatum = (DateTime)selectedMeetmiddel.datum_gekeurd;
            Bouwjaar = (int)selectedMeetmiddel.bouwjaar;
            Benaming = selectedMeetmiddel.benaming;
            Codenummer = selectedMeetmiddel.code_nr;
            Leverancier = selectedMeetmiddel.leverancier;
            Merk = selectedMeetmiddel.merk;
            Certificaat = selectedMeetmiddel.stamkaart;


            if (selectedMeetmiddel.stamkaart == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = selectedMeetmiddel.stamkaart;
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


        private void editMeetmiddel()
        {

            bool canEdit = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het meetmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Meetmiddel> allPompen = context.Meetmiddel.ToList();

                    foreach (var Meetmiddel in allPompen)
                    {

                        if (Meetmiddel.code_nr != null && !(Meetmiddel.Id == meetOver.SelectedMeetmiddel.Id) && Meetmiddel.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een ander Meetmiddel heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canEdit = false;
                            break;
                        }
                    }

                    if (canEdit)
                    {
                        foreach (var pomp in allPompen)
                        {
                            if (pomp.Id == meetOver.SelectedMeetmiddel.Id)
                            {
                                pomp.benaming = Benaming;
                                pomp.bouwjaar = Bouwjaar;
                                pomp.code_nr = Codenummer;
                                pomp.leverancier = Leverancier;
                                pomp.datum_gekeurd = Keuringdatum;
                                pomp.datum_herkeuring = Herkeuringsdatum;
                                pomp.merk = Merk;
                                pomp.stamkaart = Certificaat;
                                pomp.datum_laatst_aangepast = DateTime.Now;
                            }
                        }


                        context.SaveChanges();


                        MessageBox.Show("uw meetmiddel is succesvol aangepast!");
                        meetOver.updateLists();
                        Navigator.SetNewView(new MeetmiddelOverzichtView());
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

