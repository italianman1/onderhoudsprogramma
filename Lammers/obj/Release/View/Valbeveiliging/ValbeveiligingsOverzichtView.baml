   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Lammers.View.ValbeveiligingLammers.View.Valbeveiliging  >    8Lammers.View.Valbeveiliging.ValbeveiligingsOverzichtView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Lammers.View.Valbeveiliging     $��1267.816��  � DataContext  �� *ValbeveiligingsOverzicht+   Locator �� Source# [  .��� .+�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q����	#FF979494   GridLinesVisibility$ 
Horizontal=�   HorizontalGridLinesBrush �	#FFF0E0E0   HeadersVisibility$ Column=�	 �� SelectedItem	 �� *SelectedValbeveiliging+
 �� Mode$
 TwoWay=����� *Valbeveiliging+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Omschrijving��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *omschrijving+  $ Opdracht nummer��$ *  �� *	opdr_nr+  $ Persoon��$ *  �� *	persoon+  $ Serie nr��$ *  �� *
serie_nr+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$ *  �� *datum_herkeuring+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteValbeveiligingCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$
��1248������ *SearchString+$ PropertyChanged=��� -    ��Name$ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75�� J� RenderTransformOrigin$ -0.18,0.568&��� -   $ button3��$
��Left=�$��47��$	��Top=�$��91������ *HomeCommand+.���� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��44��$	��Top=�$��88���� -   $ button��$��Maak valbeveiliging��$��20(�$
��Left=�$��	254,9,0,0q�$	��Top=�$	��195��$��38������ *AddValbeveiligingCommand+�� -   $ button_Copy��$��Wijzig valbeveiliging��$��20(�$
��Left=�$��
478,10,0,0q�$	��Top=�$	��203��$��37������ *EditValbeveiligingCommand+�� -	   $ button_Copy1��$��Verwijder valbeveiliging��$��20(�$
��Left=�$��
701,10,0,0q�$	��Top=�$	��227��$��37������ *DeleteValbeveiligingCommand+�� $��Open certificaat��$
��Left=�$��
961,10,0,0q�$	��Top=�$��20(�$	��161��$��37������ *OpenCertificateCommand+