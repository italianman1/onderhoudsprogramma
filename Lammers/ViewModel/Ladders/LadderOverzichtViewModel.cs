using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Ladders;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
            }

            DeleteLadderCommand = new RelayCommand(deleteLadder, canDelete);
            AddLadderCommand = new RelayCommand(openAddWindow);
            EditLadderCommand = new RelayCommand(openEditWindow);
            OpenCertificateCommand = new RelayCommand(openCertificate);
            BackCommand = new RelayCommand(PerformBack);
        }

        public ICommand DeleteLadderCommand { get; set; }
        public ICommand AddLadderCommand { get; set; }
        public ICommand EditLadderCommand { get; set; }
        public ICommand OpenCertificateCommand { get; set; }
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

                MessageBoxResult dialogResult = MessageBox.Show("Weet u zeker dat u deze ladder wilt verwijderen?", "Verwijder " + SelectedLadder.benaming, MessageBoxButton.YesNo);
                if (dialogResult == MessageBoxResult.Yes)
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
                System.Diagnostics.Process.Start("M:\\Certificaten onderhoudsprogramma\\Ladders\\Testresultaten.pdf");
            }

            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }

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
