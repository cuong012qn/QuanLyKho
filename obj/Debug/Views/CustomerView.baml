   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5   	   5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5   	   '    !QuanLyKho_MVVM.Views.CustomerView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:QuanLyKho_MVVM.Views     5   	   .ucclr-namespace:QuanLyKho_MVVM.UC     5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5	   	   -   5        $��customerView��5   	   $��20(�5   	      
CustomerVM  � DataContext#  [  5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�6.    � 
ResizeMode$ NoResize=�6A    � Title$ Thông tin khách hàng��5   	   $	��700��6&   $	��800��63    J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
   	   	EventName$	 Loaded��6   .  (System.Windows.Interactivity.TriggerBase
   Actions.
 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedCommand+   CommandParameter 5   $   ��  �� ElementName$ customerView��5      .��5      ]� .+�5   
      QuanLyKho_MVVM.UC.UCBar  $	��Top=�6B   
 � Tag 6   �� *Title+$ customerView��6Y   #  MaterialDesignThemes.Wpf.Card  5   
   $��5q�6   $	��Top=�6)   .��5      �� .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�6   .��5      �  � ColumnDefinitions 5       �� 5!      6-   �� 5"      6-    � RowDefinitions 5$      �� 5%      $	��150 �6(   67   �� 5&      6*   .+�5(      �� $��5q�6!   .+�5)      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Họ và tên��6"    % !MaterialDesignFloatingHintTextBox#��[ 6M   ��6�   �� *DisplayName+�� 5*      $ Địa chỉ��6"   #��[ 6K   ��6�   �� *	Address+�� 5+      $ Điện thoại��6"   #��[ 6N   ��6�   �� *Phone+5,      �� 5-      $��1��6!   $��5q�61   .+�5.      �� $ Email��6"   #��[ 6I   ��6�   �� *Email+�� 5/      $ Ghi chú��6"   #��[ 6K   ��6�   �� *
MoreInfo+(	  "System.Windows.Controls.DatePicker	  50      -   5         	 Name$ FutureDatePicker��50   &   $ Chọn ngày��6A   $��0 12 0 0q�6l    	  SelectedDate 6~   �� *ContractDate+51      52      �� 53      $��1��6!   $��1��61    �� Orientation$ 
Horizontal=�6>   $��Right=�6W   $��0 10 0 0q�6s   .+�54      �� $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *
AddCommand+.��55      �� $ 
Horizontal=�6)   .+�56   "   '
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�6:   $��Stretch=�6E   �� 57   "   
Thêm (F5)67   58      59      �� 5:      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *DeleteCommand+.��5;      �� $ 
Horizontal=�6)   .+�5<   "   
  $ Delete=�6:   $��Stretch=�6H   �� 5=   "   $��	Xóa (F6)��6,   6>   5>      5?      �� 5@      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *EditCommand+.��5A      �� $ 
Horizontal=�6)   .+�5B   "   
  $ ModeEditOutline=�6:   $��Stretch=�6Q   �� 5C   "   $��
Sửa (F7)��6,   6>   5D      5E      5F      5G      5H      5I        5J   
   $��1��6   $��Stretch=�6+   $��Stretch=�6I   $��5q�6e   .��5K      �� -   5         ��Name$ scrollViewer��5K   3   $��1��6   $��5q�6(   .��5L      �� ��6   �� *ListCustomers+ �� Mode$ TwoWay=� �� SelectedItem 6N   �� *SelectedCustomer+$ OneWayToSource=� �� View 5N      �� 5O      .P�5P      �� $��	Họ tên��6-    �� DisplayMemberBinding 6=   �� *DisplayName+6l   �� 5Q      $��Địa chỉ��6-    6>   �� *	Address+6i   �� 5R      $��Điện thoại��6-    6A   �� *Phone+6j   �� 5S      $��Email��6-    6<   �� *Email+6e   �� 5T      $��Ghi chú��6-    6>   �� *
MoreInfo+6j   5U      5W      5X      5Y      5Z      5[      