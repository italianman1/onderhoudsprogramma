   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  6    0Lammers.View.Hijsmiddelen.HijsgereedschappenView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     9local'clr-namespace:Lammers.View.Hijsmiddelen     $��1407.794��  � DataContext  �� *Hijsmiddelen+   Locator �� Source# [  .��� $	��337��.+��� $��Verwijder Hijsmiddel��$��24(�$
��Left=�$��
490,10,0,0q�$	��Top=�$	��259��$��45�� J� RenderTransformOrigin$ 	0.2,0.518&����� *%#DataContext.DeleteHijsmiddelCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .  	   
IsReadOnly	 . $��11,124,28,0q����	#FF979494
   GridLinesVisibility$
 
Horizontal=�   HorizontalGridLinesBrush �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedHijsmiddel+ �� Mode$ TwoWay=����� *Hijsmiddelen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Soort hijsmiddel��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *soort+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$ *  �� *datum_herkeuring+  $ Certificaat nr��$ *  �� *
certi_nr+  $ Registratie nr��$ *  �� *reg_nr+  $ Certificaat link��$ *  �� *certificaat+  $ Status��$	 350  �� *status+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteHijsmiddelCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,77,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$	��794������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuw Hijsmiddel��$��24(�$
��Left=�$��	238,9,0,0q�$	��Top=�$	��212��$��45������ *AddHijsmiddelCommand+�� -   $ button1��$��Bewerk Hijsmiddel��$��24(�$
��Left=�$��	793,9,0,0q�$	��Top=�$	��234��$��45������ *EditHijsmiddelCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75��$ -0.18,0.568&��� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134���� $��Open Certificaat��$
��Left=�$��
1054,9,0,0q�$	��Top=�$	��205��$��24(�$��45������ *OpenCertificateCommand+�� $��Stevens��$��25(�$
��Left=�$��
860,77,0,0q�$	��Top=�$��38��$	��184������ *FilterCommand+  d� 	IsChecked  �� *StevensFilter+�� $��Lammers��$��25(�$
��Left=�$��1044,77,0,0q�$	��Top=����� *FilterCommand+  �� *LammersFilter+