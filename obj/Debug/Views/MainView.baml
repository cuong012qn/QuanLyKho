   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5   	   5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5	   	   #    QuanLyKho_MVVM.Views.MainView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:QuanLyKho_MVVM.Views     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (ucclr-namespace:QuanLyKho_MVVM.UC  5	   	   -   5        $��mainView��5   	   $��20(�5   	     � Title$  Màn hình chính��5   	   $	��700��6    $
��1100��6-    � WindowStartupLocation$ CenterScreen=�5   	    
  MainVM � DataContext# [  5   	    � AllowsTransparency .  � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�6   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction  	   Command	 6$   �� *LoadedWindowCommand+
   CommandParameter
 5   $   ��  �� ElementName$ mainView��5      .��5      )  #MaterialDesignThemes.Wpf.DialogHost     
Identifier$
 Root��6    .��5   
   ]� .+�5         QuanLyKho_MVVM.UC.UCBar  $	��Top=�6B   
 � Tag 6   �� *Title+$ mainView��6Y   �� 5       �� Orientation$ 
Horizontal=�6   $��Right=�63   $	��Top=�6O   .+�5      �� $��5q�6   $��20(�6D   $��Center=�6R   $��Center=�6o   ��6'   �� *DisplayName+5      �� 5      $��
Thông tin��6   $��20(�6-   ���	#FF81CAF3
�������$��5q�5      $��50��6    ��5       �� *CommandChangeInfoUser+6A   5!      #  MaterialDesignThemes.Wpf.Card  5"      $��Stretch=�6"   $��Stretch=�6@   $��5q�6\   $	��Top=�6g   .��5#      �� $��Chức năng��6   $��5q�6.   $��20(�5$      $	��150��6!   $	��Top=�6.   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�5%      .��5&      �  � ColumnDefinitions 5'      �� 5(      $	��150 �6/   6=   �� 5)      $	��150 �6/   6=   �� 5*      $	��150 �6/   6=   �� 5+      $	��150 �6/   6=   �� 5,      $	��150 �6/   6=   �� 5-      $	��150 �6/   6=   .+�5/      �� $��75��6!   $��2q�6-    # MaterialDesignRaisedLightButton#��[ 50      ���	#FF81CAF3
�������+	  %MaterialDesignThemes.Wpf.ButtonAssist 	  CornerRadius$ 5��53       � ToolTip$ 
Nhập kho��54      ��52      �� *InputCommand+.��55      �� $ 
Horizontal=�6)   .+�56   "   '
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$ Import=�6:   $��Stretch=�6I   �� 57   "   $��
Nhập kho��6,   $��20(�6<   58      59      �� 5:      #��[ 6!   ���	#FF81CAF3
�������$��75��5<      $ 5��6)   $ 
Xuất kho��5>      $��2q�60   $��1��5?      ��5=      �� *OutputCommand+.��5@      �� $ 
Horizontal=�6)   .+�5A   "   
  $ Export=�6:   $��Stretch=�6I   �� 5B   "   $��
Xuất kho��6,   $��20(�6<   5C      5E      �� 5F      $��3��6!   $��75��61   #��[ 5G      ���	#FF81CAF3
�������$ 5��5J      $ Thông tin khách hàng��5K      $��2q�6<   ��5I      �� *CustomerCommand+.��5L      �� $ 
Horizontal=�6)   .+�5M   "   
  $ UserBox=�6:   $��	-10 0 0 0q�6I   $��Stretch=�5N   2   �� 5O   "   $��Khách hàng��6,   $
��Wrap=�5P   $   $��20(�68   5Q      5S      �� 5T      $��2��6!   $��75��61   #��[ 5U      ���	#FF81CAF3
�������$ 5��5X      $ 
Đơn vị��5Y      $��2q�6.   ��5W      �� *UnitCommand+.��5Z      �� $ 
Horizontal=�6)   .+�5[   "   
  $ 
AngleAcute=�6:   $��Stretch=�6L   �� 5\   "   $��
Đơn vị��6,   $
��Wrap=�5]   $   $��20(�68   5^      5`      �� 5a      $��4��6!   $��75��61   #��[ 5b      ���	#FF81CAF3
�������$ 5��5e      $ Nhà cung cấp��5f      $��2q�64   ��5d      �� *SuplierCommand+.��5g      �� $ 
Horizontal=�6)   .+�5h   "   
  $ ImportExport=�6:   $��Stretch=�6N   �� 5i   "   .+�5j   &   �� $��
Nhà cung ��60   $
��Wrap=�5k   $   $��20(�68   �� 5l   &   $��cấp��60   $
��Wrap=�5m   $   $��20(�68   5n   #   5p      5r      �� 5s      $��5��6!   $��75��61   #��[ 5t      ���	#FF81CAF3
�������$ 5��5w      $ Khách hàng��5x      $��2q�62   ��5v      �� *ObjectCommand+.��5y      �� $ 
Horizontal=�6)   .+�5z   "   
  $ BoxVariantClosed=�6:   $��Stretch=�6R   �� 5{   "   $��Mặt hàng��6,   $
��Wrap=�5|   $   $��20(�68   5}      5      5�      5�      5�        5�      $��Stretch=�6"   $��Stretch=�6@   $��5q�6\   $	��Top=�6g   .��5�      �� $��Thống kê��6   $��5q�6-   $ PrimaryLight=�5�      .��5�      ]� .+�5�      �� $ 
Horizontal=�6%   $	��Top=�6>   $��5q�6S   .+�5�      �� $��5q�6(   $��
Từ ngày��63   $��Stretch=�6B   6`   (  "System.Windows.Controls.DatePicker  5�      $	��150��6)   67   �� 5�      $��5q�6(   $��Đến ngày��63   $��Stretch=�6C   6a     5�      $	��150��6)   67   5�      �� 5�      $
��Auto=�6'   $
��Auto=�6L   $	��Top=�6o   .��5�      �� $��5q�6'   ��62   �� *ListInputInfos+ �� Mode$ TwoWay=� �� View 5�   "   �� 5�   &   .P�5�   *   �� $��Tên hàng hóa��69    �� DisplayMemberBinding 6O   �� *Object.DisplayName+6�   �� 5�   *   $��Số lượng��69    6K   �� *Count+6t   �� 5�   *   $��Giá nhập��69    6K   �� *
InputPrice+6y   �� 5�   *   $��	Giá bán��69    6J   �� *OutputPrice+6y   �� 5�   *   $��Tình trạng��69    6M   �� *Status+6w   �� 5�   *   $��
Ngày bán��69    6K   �� *Input.DateInput+6~   5�   '   5�      5�      5�      5�      5�      5�      5�      5�      