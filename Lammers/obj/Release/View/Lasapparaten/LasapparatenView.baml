   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.LasapparatenLammers.View.Lasapparaten  0    *Lammers.View.Lasapparaten.LasapparatenView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     9local'clr-namespace:Lammers.View.Lasapparaten     $��1138.718��  � DataContext  �� *Lasapparaten+   Locator �� Source# [  .��� .+��� $��Verwijder Lasapparaat��$��20(�$
��Left=�$��
476,11,0,0q�$	��Top=�$	��213��$��36������ *&$DataContext.DeleteLasapparaatCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q����	#FF979494	   GridLinesVisibility$	 
Horizontal=�
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedLasapparaat+ �� Mode$ TwoWay=����� *Lasapparaten+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Benaming��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *
benaming+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$ *  �� *datum_herkeuring+  $ LAM_nr��$ *  �� *LAM_nr+  $ Code_nr��$ *  �� *	code_nr+  $ Locatie��$ *  �� *	locatie+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteLaspparaatCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$	��679������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuw Lasapparaat��$��20(�$
��Left=�$��
259,11,0,0q�$	��Top=�$	��184��$��34������ *AddLasapparaatCommand+�� -   $ button1��$��Bewerk Lasapparaat��$��20(�$
��Left=�$��	710,9,0,0q�$	��Top=�$	��193��$��36������ *EditLasapparaatCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75�� J� RenderTransformOrigin$ -0.18,0.568&��� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134���� $��Open Certificaat��$
��Left=�$��	936,7,0,0q�$	��Top=�$	��177��$��20(�$��40������ *OpenCertificateCommand+�� $��Stevens��$��25(�$
��Left=�$��
719,57,0,0q�$	��Top=�$��34��$	��107������ *FilterCommand+  d� 	IsChecked  �� *StevensFilter+�� $��Lammers��$��25(�$
��Left=�$��
852,58,0,0q�$	��Top=����� *FilterCommand+  �� *LammersFilter+