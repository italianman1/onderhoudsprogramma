/*
  In App.xaml:
  <Application.Resources>
      <vm:ViewModelLocator xmlns:vm="clr-namespace:Lammers"
                           x:Key="Locator" />
  </Application.Resources>
  
  In the View:
  DataContext="{Binding Source={StaticResource Locator}, Path=ViewModelName}"

  You can also use Blend to do all this with the tool's support.
  See http://www.galasoft.ch/mvvm
*/

using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Ioc;
using Lammers.ViewModel.Algemeen;
using Lammers.ViewModel.Compressoren;
using Lammers.ViewModel.Hefmiddelen;
using Lammers.ViewModel.Hijsmiddelen;
using Lammers.ViewModel.Kranen;
using Lammers.ViewModel.Ladders;
using Lammers.ViewModel.Lasapparaten;
using Lammers.ViewModel.Meetmiddelen;
using Lammers.ViewModel.Opleggers;
using Lammers.ViewModel.Valbeveiligingen;
using Lammers.ViewModel.Verfpompen;
using Microsoft.Practices.ServiceLocation;

namespace Lammers.ViewModel
{
    /// <summary>
    /// This class contains static references to all the view models in the
    /// application and provides an entry point for the bindings.
    /// </summary>
    public class ViewModelLocator
    {
        /// <summary>
        /// Initializes a new instance of the ViewModelLocator class.
        /// </summary>
        public ViewModelLocator()
        {
            ServiceLocator.SetLocatorProvider(() => SimpleIoc.Default);

            ////if (ViewModelBase.IsInDesignModeStatic)
            ////{
            ////    // Create design time view services and models
            ////    SimpleIoc.Default.Register<IDataService, DesignDataService>();
            ////}
            ////else
            ////{
            ////    // Create run time view services and models
            ////    SimpleIoc.Default.Register<IDataService, DataService>();
            ////}

            SimpleIoc.Default.Register<MainViewModel>();
            SimpleIoc.Default.Register<OverzichtViewModel>();
            SimpleIoc.Default.Register<HijsmiddelenViewModel>();
            SimpleIoc.Default.Register<AddHijsmiddelViewModel>();
            SimpleIoc.Default.Register<EditHijsmiddelViewModel>();
            SimpleIoc.Default.Register<LasapparatenViewModel>();
            SimpleIoc.Default.Register<AddLasapparaatViewModel>();
            SimpleIoc.Default.Register<ValbeveiligingsOverzichtViewModel>();
            SimpleIoc.Default.Register<AddValbeveiligingViewModel>();
            SimpleIoc.Default.Register<EditValbeveiligingViewModel>();
            SimpleIoc.Default.Register<EditLasapparaatViewModel>();
            SimpleIoc.Default.Register<OpleggerOverzichtViewModel>();
            SimpleIoc.Default.Register<KranenOverzichtViewModel>();
            SimpleIoc.Default.Register<LadderOverzichtViewModel>();
            SimpleIoc.Default.Register<AddLadderViewModel>();
            SimpleIoc.Default.Register<EditLadderViewModel>();
            SimpleIoc.Default.Register<AddVerfpompViewModel>();
            SimpleIoc.Default.Register<EditVerfpompViewModel>();
            SimpleIoc.Default.Register<VerfpompOverzichtViewModel>();
            SimpleIoc.Default.Register<AddMeetmiddelViewModel>();
            SimpleIoc.Default.Register<EditMeetmiddelViewModel>();
            SimpleIoc.Default.Register<MeetmiddelOverzichtViewModel>();
            SimpleIoc.Default.Register<AddHefmiddelViewModel>();
            SimpleIoc.Default.Register<EditHefmiddelViewModel>();
            SimpleIoc.Default.Register<HefmiddelOverzichtViewModel>();
            SimpleIoc.Default.Register<AddCompressorViewModel>();
            SimpleIoc.Default.Register<EditCompressorViewModel>();
            SimpleIoc.Default.Register<CompressorOverzichtViewModel>();
            SimpleIoc.Default.Register<AddAlgemeenViewModel>();
            SimpleIoc.Default.Register<EditAlgemeenViewModel>();
            SimpleIoc.Default.Register<AlgemeenOverzichtViewModel>();
        }

        public MainViewModel Main
        {
            get
            {
                return ServiceLocator.Current.GetInstance<MainViewModel>();
            }
        }

        public OverzichtViewModel Overzicht
        {
            get
            {
                return ServiceLocator.Current.GetInstance<OverzichtViewModel>();
            }
        }

        public HijsmiddelenViewModel Hijsmiddelen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<HijsmiddelenViewModel>();
            }
        }

        public AddHijsmiddelViewModel AddHijsmiddel
        {
            get
            {
                return new AddHijsmiddelViewModel(Hijsmiddelen);

            }
        }

        public EditHijsmiddelViewModel EditHijsmiddel
        {
            get
            {
                return new EditHijsmiddelViewModel(Hijsmiddelen);
            }
        }

        public LasapparatenViewModel Lasapparaten
        {
            get
            {
                return ServiceLocator.Current.GetInstance<LasapparatenViewModel>();
            }
        }

        public AddLasapparaatViewModel AddLasapparaat
        {
            get
            {
                return new AddLasapparaatViewModel(Lasapparaten);
            }
        }

        public ValbeveiligingsOverzichtViewModel ValbeveiligingsOverzicht
        {
            get
            {
                return ServiceLocator.Current.GetInstance<ValbeveiligingsOverzichtViewModel>();
            }
        }

        public AddValbeveiligingViewModel AddValbeveiliging
        {
            get
            {
                return new AddValbeveiligingViewModel(ValbeveiligingsOverzicht);
            }
        }

        public EditValbeveiligingViewModel EditValbeveiliging
        {
            get
            {
                return new EditValbeveiligingViewModel(ValbeveiligingsOverzicht.SelectedValbeveiliging, ValbeveiligingsOverzicht);
            }
        }

        public EditLasapparaatViewModel EditLasapparaat
        {
            get
            {
                return new EditLasapparaatViewModel(Lasapparaten);
            }
        }

        public OpleggerOverzichtViewModel Opleggers
        {
            get
            {
                return ServiceLocator.Current.GetInstance<OpleggerOverzichtViewModel>();
            }
        }

        public AddOpleggerViewModel AddOplegger
        {
            get
            {
                return new AddOpleggerViewModel(Opleggers);
            }
        }

        public EditOpleggerViewModel EditOplegger
        {
            get
            {
                return new EditOpleggerViewModel(Opleggers);
            }
        }

        public KranenOverzichtViewModel Kranen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<KranenOverzichtViewModel>();
            }
        }

        public AddKraanViewModel AddKraan
        {
            get
            {
                return new AddKraanViewModel(Kranen);
            }
        }

        public EditKraanViewModel EditKraan
        {
            get
            {
                return new EditKraanViewModel(Kranen);
            }
        }

        public LadderOverzichtViewModel Ladders
        {
            get
            {
                return ServiceLocator.Current.GetInstance<LadderOverzichtViewModel>();
            }
        }

        public AddLadderViewModel AddLadder
        {
            get
            {
                return new AddLadderViewModel(Ladders);
            }
        }

        public EditLadderViewModel EditLadder
        {
            get
            {
                return new EditLadderViewModel(Ladders);
            }
        }

        public VerfpompOverzichtViewModel Verfpompen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<VerfpompOverzichtViewModel>();
            }
        }

        public AddVerfpompViewModel AddVerfpomp
        {
            get
            {
                return new AddVerfpompViewModel(Verfpompen);
            }
        }

        public EditVerfpompViewModel EditVerfpomp
        {
            get
            {
                return new EditVerfpompViewModel(Verfpompen);
            }
        }

        public MeetmiddelOverzichtViewModel Meetmiddelen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<MeetmiddelOverzichtViewModel>();
            }
        }

        public AddMeetmiddelViewModel AddMeetmiddel
        {
            get
            {
                return new AddMeetmiddelViewModel(Meetmiddelen);
            }
        }

        public EditMeetmiddelViewModel EditMeetmiddel
        {
            get
            {
                return new EditMeetmiddelViewModel(Meetmiddelen);
            }
        }

        public HefmiddelOverzichtViewModel Hefmiddelen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<HefmiddelOverzichtViewModel>();
            }
        }

        public AddHefmiddelViewModel AddHefmiddel
        {
            get
            {
                return new AddHefmiddelViewModel(Hefmiddelen);
            }
        }

        public EditHefmiddelViewModel EditHefmiddel
        {
            get
            {
                return new EditHefmiddelViewModel(Hefmiddelen);
            }
        }

        public CompressorOverzichtViewModel Compressoren
        {
            get
            {
                return ServiceLocator.Current.GetInstance<CompressorOverzichtViewModel>();
            }
        }

        public AddCompressorViewModel AddCompressor
        {
            get
            {
                return new AddCompressorViewModel(Compressoren);
            }
        }

        public EditCompressorViewModel EditCompressor
        {
            get
            {
                return new EditCompressorViewModel(Compressoren);
            }
        }

        public AlgemeenOverzichtViewModel Algemeen
        {
            get
            {
                return ServiceLocator.Current.GetInstance<AlgemeenOverzichtViewModel>();
            }
        }

        public AddAlgemeenViewModel AddAlgemeen
        {
            get
            {
                return new AddAlgemeenViewModel(Algemeen);
            }
        }

        public EditAlgemeenViewModel EditAlgemeen
        {
            get
            {
                return new EditAlgemeenViewModel(Algemeen);
            }
        }




        public static void Cleanup()
        {
            // TODO Clear the ViewModels
        }
    }
}