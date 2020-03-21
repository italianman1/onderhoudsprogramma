using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Opleggers;
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

namespace Lammers.ViewModel.Opleggers
{
    public class EditOpleggerViewModel
    {
        private string _codenummer;
        private int _bouwjaar;
        private string _kenteken;
        private string _locatie;
        private string _leverancier;
        private string _benaming;
        private string _certificaat;
        private string _filetext;
        private string _selectedStat;
        private List<string> _stats;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private OpleggerOverzichtViewModel OpleggerOver;
        private Oplegger selectedOplegger;
        public ICommand EditOplegger { get; set; }
        public ICommand ChooseCertificate { get; set; }
        public ICommand BackCommand { get; set; }

        public EditOpleggerViewModel(OpleggerOverzichtViewModel opleg)
        {
            EditOplegger = new RelayCommand(editOplegger);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            BackCommand = new RelayCommand(PerformBack);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            OpleggerOver = opleg;
            selectedOplegger = OpleggerOver.SelectedOplegger;
            Benaming = selectedOplegger.benaming;
            Codenummer = selectedOplegger.code_nr;
            Bouwjaar = (int)selectedOplegger.bouwjaar;
            Kenteken = selectedOplegger.kenteken;
            Keuringdatum = (DateTime)selectedOplegger.datum_gekeurd;
            Herkeuringsdatum = (DateTime)selectedOplegger.datum_herkeuring;
            Leverancier = selectedOplegger.leverancier;
            Locatie = selectedOplegger.locatie;
            Certificaat = selectedOplegger.stamkaart;
            SelectedStat = selectedOplegger.status;
            _stats = new List<string>();
            _stats.Add("Geschorst");
            _stats.Add("In gebruik");
            _stats.Add("Certificaat onderweg");
            _stats.Add("Niet meer in gebruik");
            _stats.Add("Bij keuring");
            Stats = new ObservableCollection<string>(_stats);


            if (selectedOplegger.stamkaart == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = selectedOplegger.stamkaart;
            }

       
       

        }


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

        public ObservableCollection<string> Stats { get; set; }
        public string SelectedStat
        {
            get
            {
                return _selectedStat;
            }

            set
            {
                _selectedStat = value;
                RaisePropertyChanged("SelectedStat");
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

        public string Kenteken
        {
            get
            {
                return _kenteken;
            }

            set
            {
                _kenteken = value;
                RaisePropertyChanged("Kenteken");
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


        private void editOplegger()
        {

            bool canAdd = true;

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het hijsmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Oplegger> allOpleggers = context.Oplegger.ToList();

                    foreach (var oplegger in allOpleggers)
                    {
                        if (!(oplegger.Id == selectedOplegger.Id) && oplegger.code_nr == Codenummer)
                        {
                            MessageBox.Show("Een andere oplegger heeft hetzelfde codenummer, verander dit naar een ander uniek nummer aub");
                            canAdd = false;
                            break;
                        }

                        else if (!(oplegger.Id == selectedOplegger.Id) && oplegger.benaming.Equals(Benaming))
                        {
                            MessageBox.Show("Een andere oplegger heeft dezelfde benaming, verander dit naar een andere unieke benaming aub");
                            canAdd = false;
                            break;
                        }

                        else if (!(oplegger.Id == selectedOplegger.Id) && oplegger.kenteken.Equals(Kenteken))
                        {
                            MessageBox.Show("Een andere oplegger heeft hetzelfde kenteken, verander dit naar een ander uniek kenteken aub");
                            canAdd = false;
                            break;
                        }
                    }



                    if (canAdd)
                    {
                        foreach(var oplegger in allOpleggers)
                        {
                            if(oplegger.Id == selectedOplegger.Id)
                            {
                                oplegger.benaming = Benaming;
                                oplegger.leverancier = Leverancier;
                                oplegger.bouwjaar = Bouwjaar;
                                oplegger.code_nr = Codenummer;
                                oplegger.datum_gekeurd = Keuringdatum;
                                oplegger.datum_herkeuring = Herkeuringsdatum;
                                oplegger.kenteken = Kenteken;
                                oplegger.locatie = Locatie;
                                oplegger.stamkaart = Certificaat;
                                oplegger.status = SelectedStat;
                                oplegger.datum_laatst_aangepast = DateTime.Now;
                            }
                        }
                      
                        context.SaveChanges();


                        MessageBox.Show("uw oplegger is succesvol aangepast!");
                        OpleggerOver.updateLists();
                        Navigator.SetNewView(new OpleggerOverzichtView());
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
