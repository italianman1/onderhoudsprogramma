using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Lammers.Miscellaneous;
using Lammers.Properties;
using Lammers.View;
using System.Collections.Generic;
using System.Windows.Controls;
using System.Windows.Input;

namespace Lammers.ViewModel
{
    /// <summary>
    /// This class contains properties that the main View can data bind to.
    /// <para>
    /// Use the <strong>mvvminpc</strong> snippet to add bindable properties to this ViewModel.
    /// </para>
    /// <para>
    /// You can also use Blend to data bind with the tool's support.
    /// </para>
    /// <para>
    /// See http://www.galasoft.ch/mvvm
    /// </para>
    /// </summary>
    public class MainViewModel : ViewModelBase
    {
        /// <summary>
        /// Initializes a new instance of the MainViewModel class.
        /// </summary>

        private UserControl _currentView;
        


        public MainViewModel()
        {
      
            BackCommand = new RelayCommand(PerformBack, CanPerformBack);
            MenuOverzichtCommand = new RelayCommand(PerformOverzicht);
            //AssignmentNavigationCommand = new RelayCommand(PerformAssignmentNavigation);
            // ProfileNavigationCommand = new RelayCommand(PerfromProfilenNavigation);
            // ProfileListNavigationCommand = new RelayCommand(PerfromProfileListNavigation);
            //CustomerNavigationCommand = new RelayCommand(PerformCustomerNavigation);
            HomeCommand = new RelayCommand(PerformHome);
            var hView = new HomeView();
            Navigator.ViewHistory.AddFirst(hView);
            Navigator._currentViewNode = new LinkedListNode<UserControl>(hView);
            CurrentView = hView;

            //List<Theme> Themes = new List<Theme>
            //{
            //	new Theme("No theme (default)", null),
            //	new Theme("Expression Dark", new Uri("/ParkInspectGroupC;component/Themes/ExpressionDark.xaml", UriKind.Relative)),
            //	new Theme("Expression Light", new Uri("/ParkInspectGroupC;component/Themes/ExpressionLight.xaml", UriKind.Relative)),
            //	new Theme("Shiny Blue", new Uri("/ParkInspectGroupC;component/Themes/ShinyBlue.xaml", UriKind.Relative)),
            //	new Theme("Shiny Red", new Uri("/ParkInspectGroupC;component/Themes/ShinyRed.xaml", UriKind.Relative)),
            //};

         
        }


        public UserControl CurrentView
        {
            get { return _currentView; }
            set
            {
           
                _currentView = value;
                RaisePropertyChanged("CurrentView");
            }
        }

       

        public ICommand BackCommand { get; set; }
        public ICommand HomeCommand { get; set; }

        public ICommand MenuOverzichtCommand { get; set; }


     
        private void PerformBack()
        {
            Navigator.Back();
        }

        private void PerformHome()
        {
            Navigator.SetNewView(new HomeView());
        }

        private void PerformOverzicht()
        {
            Navigator.SetNewView(new OverzichtView());
        }

        //private void PerfromProfileListNavigation()
        //{
        //    Navigator.SetNewView(new InspectorsListView());
        //}

        //private void PerfromProfilenNavigation()
        //{
        //    Navigator.SetNewView(new InspectorProfileView());
        //}

        //private void PerformAssignmentNavigation()
        //{
        //    Navigator.SetNewView(new AssignmentOverview());
        //}

        //private void PerformCustomerNavigation()
        //{
        //    Navigator.SetNewView(new CustomerListView());
        //}


        private bool CanPerformBack()
        {
            return Navigator.CanGoBack();
        }
    }
}
