using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Ladders;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Lammers.ViewModel.Ladders
{
    public class LadderOverzichtViewModel
    {
       
        private List<Ladder> _allLadders;
        private List<Ladder> _Ladders;
        private string _certificaat;
        private string _searchString = "Zoek hier op registratienummer";

        public LadderOverzichtViewModel()
        {
            List<Ladder> searchedLadders;

            using (var context = new Onderhoud_calibratieEntities())
            {
                var Ladders = context.Ladder.ToList();

                searchedLadders = Ladders;

                _allLadders = searchedLadders;
                _Ladders = searchedLadders;



                List<string> Ladders_keuring = new List<string>();

                foreach (var ladder in _allLadders)
                {
                    if (ladder.datum_herkeuring < DateTime.Today)
                    {
                        Ladders_keuring.Add(ladder.benaming + " LAM " + ladder.LAM_nr + ", Datum herkeuring: " + ladder.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (Ladders_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen Ladders die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, Ladders_keuring);

                    MessageBox.Show("Deze Ladders moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }

                Certificaat = File.ReadAllText("../../ViewModel/Ladders/Testresultaten.txt");
            }

            DeleteLadderCommand = new RelayCommand(deleteLadder, canDelete);
            AddLadderCommand = new RelayCommand(openAddWindow);
            EditLadderCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            ChangeCertificateCommand = new RelayCommand(changeCertificate);
            OpenIndividualCertificateCommand = new RelayCommand(openIndividualCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteLadderCommand { get; set; }
        public ICommand AddLadderCommand { get; set; }
        public ICommand EditLadderCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
        public ICommand ChangeCertificateCommand { get; set; }
        public ICommand OpenIndividualCertificateCommand { get; set; }
        public ICommand BackCommand { get; set; }

        public List<Ladder> Ladders
        {
            get
            {
                return _Ladders;
            }

            set
            {
                _Ladders = value;
                RaisePropertyChanged("Ladders");
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


        public Ladder SelectedLadder { get; set; }

        public string SearchString
        {
            get { return _searchString; }

            set
            {
                _searchString = value;


                var searchedLadders = new List<Ladder>();

                foreach (var ladder in _allLadders)
                    if ((_searchString != null) && ladder.LAM_nr.ToString().ToLower().Contains(SearchString))
                    {
                        searchedLadders.Add(ladder);
                    }


                _Ladders = searchedLadders;

                RaisePropertyChanged("Ladders");
            }
        }

        public void deleteLadder()
        {
            if (SelectedLadder != null)
            {

                System.Windows.MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze ladder wilt verwijderen?", "Verwijder " + SelectedLadder.benaming, System.Windows.MessageBoxButton.YesNo);
                if (dialogResult == System.Windows.MessageBoxResult.Yes)
                {
                    using (var context = new Onderhoud_calibratieEntities())
                    {
                        var Ladders = context.Ladder.ToList();

                        foreach (var ladder in Ladders)
                            if (ladder.Id == SelectedLadder.Id)
                                context.Ladder.Remove(ladder);
                        context.SaveChanges();


                        _Ladders = context.Ladder.ToList();
                        _allLadders = context.Ladder.ToList();
                    }


                    RaisePropertyChanged("Ladders");
                }
            }

            else
            {
                MessageBox.Show("Selecteer alstublieft eerst een ladder die u wilt verwijderen");
            }

        }

        public void openCertificate()
        {

            try
            {
                System.Diagnostics.Process.Start(Certificaat);
            }

            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }

        }

        public void changeCertificate()
        {
    
            Stream myStream = null;
            System.Windows.Forms.OpenFileDialog openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            openFileDialog1.InitialDirectory = "c:\\";

            openFileDialog1.Filter = "All files (*.*)|*.*|word files (*.docx)|*.docx|(*.doc)|*.doc"; ;
            openFileDialog1.FilterIndex = 1;
            openFileDialog1.RestoreDirectory = true;

            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                try
                {
                    if ((myStream = openFileDialog1.OpenFile()) != null)
                    {
                        FileInfo fInfo = new FileInfo(openFileDialog1.FileName);
                        string strFilePath = fInfo.FullName;
                        File.WriteAllText("../../ViewModel/Ladders/Testresultaten.txt", strFilePath);
                        Certificaat = File.ReadAllText("../../ViewModel/Ladders/Testresultaten.txt");
                    }
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }

        }

        public void openIndividualCertificate()
        {
            if (SelectedLadder != null)
                if (SelectedLadder.stamkaart == null)
                    MessageBox.Show("Deze ladder heeft geen bijgevoegde stamkaart");

                else
                    try
                    {
                        System.Diagnostics.Process.Start(SelectedLadder.stamkaart);
                    }

                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }

            else
                MessageBox.Show("Selecteer alstublieft eerst een ladder waarvan u de stamkaart wilt openen");
        }

        public void updateLists()
        {
            using (var context = new Onderhoud_calibratieEntities())
            {
                Ladders = context.Ladder.ToList();
                _allLadders = context.Ladder.ToList();

            }

            RaisePropertyChanged("Ladders");
        }

        public bool canDelete()
        {
            return true;
        }

        public void openAddWindow()
        {
            Navigator.SetNewView(new AddLadderView());
        }

        public void openEditWindow()
        {
            if (SelectedLadder != null)
                Navigator.SetNewView(new EditLadderView());

            else
                MessageBox.Show("Selecteer alstublieft eerst een ladder die u wilt wijzigen");
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
