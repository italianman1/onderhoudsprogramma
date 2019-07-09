using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Model;
using Lammers.View;
using Lammers.View.Hefmiddelen;
using Lammers.View.Hijsmiddelen;
using Lammers.View.Kranen;
using Lammers.View.Lasapparaten;
using Lammers.View.Opleggers;
using Lammers.View.Valbeveiliging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Microsoft.Office.Interop.Word;
using Lammers.View.Verfpompen;
using Lammers.View.Meetmiddelen;
using Lammers.View.Ladders;
using Lammers.View.Compressoren;
using Lammers.View.Algemeen;

namespace Lammers.ViewModel
{
   public class OverzichtViewModel
    {
        public ICommand HijsmiddelenView { get; set; }
        public ICommand ValbeveiligingView { get; set; }

        public ICommand LasapparatenView { get; set; }

        public ICommand OpleggerView { get; set; }
        public ICommand KraanView { get; set; }

        public ICommand LadderView { get; set; }
        public ICommand VerfpompView { get; set; }
        public ICommand MeetmiddelView { get; set; }
        public ICommand HefmiddelView { get; set; }
        public ICommand CompressorView { get; set; }
        public ICommand AlgemeenView { get; set; }

        public OverzichtViewModel()
        {
            HijsmiddelenView = new RelayCommand(setHijsmiddelen);
            ValbeveiligingView = new RelayCommand(setValbeveiliging);
            LasapparatenView = new RelayCommand(setLasapparaten);
            OpleggerView = new RelayCommand(setOpleggers);
            KraanView = new RelayCommand(setKranen);
            LadderView = new RelayCommand(setLadders);
            VerfpompView = new RelayCommand(setPompen);
            MeetmiddelView = new RelayCommand(setMeetmiddel);
            HefmiddelView = new RelayCommand(setHefmiddelen);
            CompressorView = new RelayCommand(setCompressor);
            AlgemeenView = new RelayCommand(setAlgemeen);

            MessageBox.Show("Let op dat binnen dit systeem de Amerikaanse datum wordt gehanteerd, alle datums staan dus in dit format: maand/dag/jaar.\n" +
                "Let dus goed op wanneer je een datum aanpast en/of leest!");
        }


        private void setHijsmiddelen()
        {
            Navigator.SetNewView(new HijsgereedschappenView());

            using (var context = new Onderhoud_calibratieEntities())
            {
                List<Hijsmiddel> allHijsmiddelen = context.Hijsmiddel.ToList();
                List<string> hijsmiddelen_keuring = new List<string>();
                foreach (var hijsmiddel in allHijsmiddelen)
                {
                    if (hijsmiddel.datum_herkeuring < DateTime.Today && !hijsmiddel.status.Equals("Opgestuurd naar de keuring") && !hijsmiddel.status.Equals("Niet gevonden") && !hijsmiddel.status.Equals("Schrot/Montagehok"))
                    {
                        hijsmiddelen_keuring.Add(hijsmiddel.soort + "(" + hijsmiddel.reg_nr + "), Datum herkeuring: " + hijsmiddel.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (hijsmiddelen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen hijsmiddelen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, hijsmiddelen_keuring);
                    MessageBox.Show("Deze hijsmiddelen moeten allemaal gekeurd worden: " + Environment.NewLine + message);

                    List<string> lines = new List<string>();

                    MessageBoxResult dialogResult = MessageBox.Show("Wilt u hier een overzicht van?", "Gekeurde hijsmiddelen overzicht", MessageBoxButton.YesNo);
                    if (dialogResult == MessageBoxResult.Yes)
                    {

                        foreach (var hijsmiddel in hijsmiddelen_keuring)
                        {
                            lines.Add(hijsmiddel);
                        }

                        string fileName = "M:\\Overzichten van gekeurde hijsmiddelen\\overzicht_op_" + DateTime.Now.ToShortDateString() + ".txt";

                        System.IO.File.WriteAllLines(fileName, lines);
                        System.Diagnostics.Process.Start(fileName);
                    }
                }

            
            }
        }

        private void setValbeveiliging()
        {
            Navigator.SetNewView(new ValbeveiligingsOverzichtView());

            using (var context = new Onderhoud_calibratieEntities())
            {
                var valbeveiliging = context.Valbeveiliging.ToList();


                List<string> valbeveiliging_keuring = new List<string>();

                foreach (var item in valbeveiliging)
                {
                    if (item.datum_herkeuring < DateTime.Today)
                    {
                        valbeveiliging_keuring.Add(item.omschrijving + "(" + item.opdr_nr + ")" + " van " + item.persoon + ", Datum herkeuring: " + item.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (valbeveiliging_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen valbeveiliging onderdelen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, valbeveiliging_keuring);

                    MessageBox.Show("Deze valbeveiliging onderdelen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }
        }


        private void setLasapparaten()
        {


            Navigator.SetNewView(new LasapparatenView());

            using (var context = new Onderhoud_calibratieEntities())
            {
                var lasapparaten = context.Lasapparaat.ToList();



                List<string> lasapparaten_keuring = new List<string>();

                foreach (var lasapparaat in lasapparaten)
                {
                    if (lasapparaat.datum_herkeuring < DateTime.Today)
                    {
                        lasapparaten_keuring.Add(lasapparaat.benaming + " LAM " + lasapparaat.LAM_nr + ", Datum herkeuring: " + lasapparaat.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (lasapparaten_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen lasapparaten die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, lasapparaten_keuring);

                    MessageBox.Show("Deze lasapparaten moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }
            }
        }
        private void setOpleggers()
        {
            Navigator.SetNewView(new OpleggerOverzichtView());
        }

        private void setKranen()
        {
            Navigator.SetNewView(new KranenOverzichtView());

            using (var context = new Onderhoud_calibratieEntities())
            {
                List<Bovenloopkraan> allKranen = context.Bovenloopkraan.ToList();
                List<string> kranen_keuring = new List<string>();
                foreach (var kraan in allKranen)
                {
                    if (kraan.datum_herkeuring < DateTime.Today)
                    {
                        kranen_keuring.Add(kraan.benaming + ", Datum herkeuring: " + kraan.datum_herkeuring.Value.ToShortDateString());
                    }

                }

                if (kranen_keuring.Count == 0)
                {
                    MessageBox.Show("Er zijn geen kranen die gekeurd moeten worden");
                }

                else
                {
                    var message = string.Join(Environment.NewLine, kranen_keuring);

                    MessageBox.Show("Deze kranen moeten allemaal gekeurd worden: " + Environment.NewLine + message);
                }

            }   
        }


        private void setLadders()
        {
            Navigator.SetNewView(new LadderOverzichtView());
        }

        private void setPompen()
        {
            Navigator.SetNewView(new VerfpompOverzichtView());
        }

        private void setHefmiddelen()
        {
            Navigator.SetNewView(new HefmiddelOverzichtView());
        }

        private void setMeetmiddel()
        {
            Navigator.SetNewView(new MeetmiddelOverzichtView());
        }

        private void setCompressor()
        {
            Navigator.SetNewView(new CompressorOverzichtView());
        }

        private void setAlgemeen()
        {
            Navigator.SetNewView(new AlgemeenOverzichtView());
        }
    }
}
