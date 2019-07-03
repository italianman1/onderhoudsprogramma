using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View.Hijsmiddelen;
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

namespace Lammers.ViewModel.Hijsmiddelen
{
    public class EditHijsmiddelViewModel
    {
        private List<string> _soorten;
        private List<string> _stats;
        private string _selectedSoort;
        private string _selectedStat;
        private string _certificaat;
        private string _filetext;
        private string _registratieNummer;
        private string _certificaatNummer;
        private bool _stevensLasbedrijf;
        private DateTime _keuringDatum;
        private DateTime _herkeuringsDatum;
        private HijsmiddelenViewModel HijsmiddelOver;
        private Hijsmiddel currentHijsmiddel;
        public ICommand EditHijsmiddel { get; set; }
        public ICommand BackCommand { get; set; }
        public ICommand ChooseCertificate { get; set; }

        public EditHijsmiddelViewModel(HijsmiddelenViewModel hijs)
        {
            _soorten = new List<string>();
            _soorten.Add("Kettingtweesprong");
            _soorten.Add("Pallethaak");
            _soorten.Add("Kettingviersprong");
            _soorten.Add("Montagepen 17mm");
            _soorten.Add("Montagepen 21mm");
            _soorten.Add("Montagetang");
            _soorten.Add("Kogelkophijshaak");
            _soorten.Add("Kettingvoorloper");
            _soorten.Add("Hijssleutel");
            _soorten.Add("Platenklem");
            _soorten.Add("Vloerplatenklem");
            _soorten.Add("Balkenklem");
            _soorten.Add("Kantelklem");
            _soorten.Add("Hefmagneet");
            _soorten.Add("Rateltakel");
            _soorten.Add("Handtakel");
            _soorten.Add("Elektrische takel");
            _soorten.Add("Hefmagneet");
            _soorten.Add("Domme kracht");
            _soorten.Add("Loopkat");
            _soorten.Add("Staalkabel");
            _soorten.Add("H-sluiting + moerbout");
            _soorten.Add("H-sluiting");
            _soorten.Add("H-sluiting + borstbout");
            _soorten.Add("Kikvors");
            _soorten.Add("Horizontale platenklem");
            _soorten.Add("Tirfor");
            _soorten.Add("Staaldraad");
            _soorten.Add("Draaibaar hijsoog");
            _stats = new List<string>();
            _stats.Add("Opgestuurd naar de keuring");
            _stats.Add("Op de werkplaats");
            _stats.Add("Certificaat onderweg");
            _stats.Add("Niet gevonden");
            _stats.Add("Schrot/Montagehok");
            _stats.Add("In bus 4-VXD-88");
            _stats.Add("In bus V-492-KL (Rob)");
            _stats.Add("In bus VG-441-S (Jeffrey)");
            _stats.Add("In bus VB-554-Z (Wim)");
            Soorten = new ObservableCollection<string>(_soorten);
            Stats = new ObservableCollection<string>(_stats);
            EditHijsmiddel = new RelayCommand(editHijsmiddel);
            BackCommand = new RelayCommand(PerformBack);
            ChooseCertificate = new RelayCommand(chooseCertificate);
            _herkeuringsDatum = DateTime.Now;
            _keuringDatum = DateTime.Now;
            HijsmiddelOver = hijs;
            currentHijsmiddel = hijs.SelectedHijsmiddel;

            if(currentHijsmiddel.certificaat == null)
            {
                fileText = "Blader...";
            }

            else
            {
                fileText = currentHijsmiddel.certificaat;
            }

            Console.WriteLine(currentHijsmiddel.soort);
            SelectedSoort = currentHijsmiddel.soort;
            SelectedStat = currentHijsmiddel.status;
            Certificaatnummer = currentHijsmiddel.certi_nr;
            Registratienummer = currentHijsmiddel.reg_nr;
            Keuringdatum = (DateTime)currentHijsmiddel.datum_gekeurd;
            Herkeuringsdatum = (DateTime)currentHijsmiddel.datum_herkeuring;
            Certificaat = currentHijsmiddel.certificaat;
            Stevens = (bool)currentHijsmiddel.stevens;

        }

        public ObservableCollection<string> Soorten { get; set; }

        public string SelectedSoort
        {
            get
            {
                return _selectedSoort;
            }

            set
            {
                _selectedSoort = value;
                RaisePropertyChanged("SelectedSoort");
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

        public string Registratienummer
        {
            get
            {
                return _registratieNummer;
            }

            set
            {
                _registratieNummer = value;
                RaisePropertyChanged("Registratienummer");
            }
        }

        public string Certificaatnummer
        {
            get
            {
                return _certificaatNummer;
            }

            set
            {
                _certificaatNummer = value;
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


        private void editHijsmiddel()
        {

            if (Herkeuringsdatum <= Keuringdatum)
            {
                MessageBox.Show("Het kan niet dat de herkeuringsdatum eerder dan of gelijk is aan de datum waarop het hijsmiddel gekeurd was. Vul een andere herkeurings- of keuringdatum in aub");
            }

            else
            {
                bool valid = true;
          
                using (var context = new Onderhoud_calibratieEntities())
                {

                    List<Hijsmiddel> allHijsmiddelen = context.Hijsmiddel.ToList();

                    foreach (var hijsmiddel in allHijsmiddelen)
                    {
                        if (hijsmiddel.reg_nr != null && !(hijsmiddel.Id == currentHijsmiddel.Id) && hijsmiddel.reg_nr == Registratienummer)
                        {
                            MessageBox.Show("Een ander hijsmiddel heeft hetzelfde registratienummer, verander dit naar een ander uniek nummer aub");
                            valid = false;
                            break;
                        }

                        else if (hijsmiddel.certi_nr != null && !(hijsmiddel.Id == currentHijsmiddel.Id) && hijsmiddel.certi_nr == Certificaatnummer)
                        {
                            MessageBox.Show("Een ander hijsmiddel heeft hetzelfde certificaatnummer, verander dit naar een ander uniek nummer aub");
                            valid = false;
                            break;
                        }

                    }



                    if(valid)
                    {
                        foreach (var hijsmiddel in allHijsmiddelen)
                        {
                            if(hijsmiddel.Id == currentHijsmiddel.Id)
                            {
                                hijsmiddel.soort = SelectedSoort;
                                hijsmiddel.status = SelectedStat;
                                hijsmiddel.certi_nr = Certificaatnummer;
                                hijsmiddel.reg_nr = Registratienummer;
                                hijsmiddel.datum_gekeurd = Keuringdatum;
                                hijsmiddel.datum_herkeuring = Herkeuringsdatum;
                                hijsmiddel.certificaat = Certificaat;
                                hijsmiddel.stevens = Stevens;
                                break;
                            }
                        }
                           
                       

                        context.SaveChanges();

                        MessageBox.Show("uw hijsmiddel is succesvol aangepast!");
                        HijsmiddelOver.updateLists();
                        Navigator.SetNewView(new HijsgereedschappenView());
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
