   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:Lammers.View.HefmiddelenLammers.View.Hefmiddelen  .    (Lammers.View.Hefmiddelen.HefmiddelenView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     8local&clr-namespace:Lammers.View.Hefmiddelen       � DataContext  �� *Hefmiddelen+   Locator �� Source# [  .��� .+��� $��Verwijder Hefmiddel��$��32(�$
��Left=�$��	799,6,0,0q�$	��Top=�$	��415��$��51������ *$"DataContext.DeleteHefmiddelCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q����	#FF979494	   GridLinesVisibility$	 
Horizontal=�
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedHijsmiddel+ �� Mode$ TwoWay=����� *Hefmiddelen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Soort hefmiddel��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *soort+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$ *  �� *datum_herkeuring+  $ Certificaat nr��$ *  �� *
certi_nr+  $ Registratie nr��$ *  �� *reg_nr+  $ Certificaat link��$ *  �� *certificaat+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteHefmiddelCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$
��1900������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuw hefmiddel��$��32(�$
��Left=�$��	269,6,0,0q�$	��Top=�$	��379��$��49������ *AddHefmiddelCommand+�� -   $ button1��$��Bewerk Hefmiddel��$��32(�$
��Left=�$��
1437,6,0,0q�$	��Top=�$	��473��$��50������ *EditHefmiddelCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75�� J� RenderTransformOrigin$ -0.18,0.568&��� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134��