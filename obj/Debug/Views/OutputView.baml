   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5   	   5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5	   	   %    QuanLyKho_MVVM.Views.OutputView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:QuanLyKho_MVVM.Views     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (ucclr-namespace:QuanLyKho_MVVM.UC  5	   	   -   5        $��
outputView��5   	      OutputVM  � DataContext#  [  5   	   $��20(�5   	    � WindowState$ 	Maximized=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�6.    � WindowStyle$
 None=�6D    � Title$ Phiếu xuất hàng hóa��5   	   $	��700��6%   $	��800��62    J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   �� 5   
   $ F8��6;    6   �� *ExportBillCommand+6F   .  (System.Windows.Interactivity.Interaction	   Triggers	 5      /  )System.Windows.Interactivity.EventTrigger  5   
   
   	EventName$
 Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ 
outputView��5      .��5      ]� .+�5   
      QuanLyKho_MVVM.UC.UCBar  $	��Top=�6   
 � Tag 6(   �� *Title+$ 
outputView��6W   ]� 5   
   .+�5       #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��Stretch=�6/   $��5q�6K   $��1��6V   $	��Top=�6g   .��5!      �� $��Phiếu nhập��6   $��5q�6/   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�6:   .��5"      �  � ColumnDefinitions 5#      �� 5$      61   �� 5%      61   �� 5&      61    � RowDefinitions 5(      �� 5)      6.   �� 5*      6.   �� 5+      6.   �� 5,      6.   �� 5-      6.   .+�51      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên khách hàng��6#   $��1��6S   $��0��6c   $��5q�6p   $��2��6{    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 52   5    �� DisplayMemberPath$ DisplayName��54   #   ��53   #   �� *ListCustomers+ �� SelectedItem 6I   �� *SelectedCustomer+55      �� 56      $ Số điện thoại��6"   {�.  $��0��57      $��0��6-   $��5q�6:    % !MaterialDesignFloatingHintTextBox#��[ 58      ��57   E   �� *SelectedCustomer.Phone+58      �� 5;      $ Nhà cung cấp��6"   $��0��6P   $��1��6`   $��5q�6m   {�.  #��[ 5=      ��5<      �� *%#SelectedObject.Supplier.DisplayName+5=      �� 5>      $ Tên mặt hàng��6#   $��1��6Q   $��1��6a   $��5q�6n    . #��[ 5?   $   $��2��6`   $ DisplayName��5A   #   ��5@   #   �� *
ListObject+ 6F   �� *SelectedObject+5B      (	  "System.Windows.Controls.DatePicker	  5E      $ Ngày nhập��6%   $��0��6P   $��3��6`   $��5q�6m    ( $MaterialDesignFloatingHintDatePicker#��[ 5F      {�.   	  SelectedDate 5G   !   �� *DateTimeInput+	  5H      $ Ngày xuất��6%   $��1��6P   $��3��6`   $��5q�6m   #��[ 5I   "    6`   �� *DateTimeOutput+ �� UpdateSourceTrigger$ PropertyChanged=��� 5J      $ Trạng thái��6"   $��2��6N   $��3��6^   $��5q�6k   
���  ��$��DemiBold"�6�   #��[ 5K      {�.  ��5L      �� *StatusInputInfo+�� 5O      $
 Giá��6"   $��2��6G   $��2��6W   $��5q�6d   #��[ 5P      {�.  ��5Q      �� *OutputPrice+�� 5R      $ 	Tồn kho��6"   $��0��6K   $��2��6[   $��5q�6h   {�.  #��[ 5T      ��5S      �� *
CountInput+5T      �� 5V      $ Số lượng xuất��6"   $��1��6Q   $��2��6a   $��0,5,10,5q�6n   #��[ 5W      ��6X   �� *CountOutput+.��6u   5X      �� 5Z      $��0��6%   $��4��65   $��3��6B    �� Orientation$ 
Horizontal=�6V   $��Right=�6o   $��0 10 0 0q�6�   .+�5[      �� $��50��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *
AddCommand+.��5\   "   �� $ 
Horizontal=�6-   .+�5]   &   '
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�6>   $��Stretch=�6I   �� 5^   &   
Thêm (F5)6;   5_   #   5`      �� 5a      $��50��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *DeleteCommand+.��5b   "   �� $ 
Horizontal=�6-   .+�5c   &   
  $ Delete=�6>   $��Stretch=�6L   �� 5d   &   $��	Xóa (F6)��60   6B   5e   #   5f      �� 5g      $��50��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *EditCommand+.��5h   "   �� $ 
Horizontal=�6-   .+�5i   &   
  $ ModeEditOutline=�6>   $��Stretch=�6U   �� 5j   &   $��
Sửa (F7)��60   6B   5k   #   5l      5m      5n      5o      5p        5q      $��Stretch=�6"   $	��Top=�6>   $��5q�6S   .��5r      �� $ Tìm kiếm hàng��6   $��5q�6�   ��6I   �� *Search+$ PropertyChanged=�6�   5s        5t      $��Stretch=�6"   $��5q�6>   $��Bottom=�6I   .��5u      �  5v      �� 5w      6-   �� 5x      6-   �� 5y      6-   �� 5z      6-    5|      �� 5}      6*   �� 5~      6*   .+�5�      �� $ Tổng tiền��6   {�.  $��3��6[   $��5q�6k   
���  ��$��DemiBold"�5�   5   ��6   �� *	SumOutput+65   �� 5�      $��50��6   $	��135��6)   $��2q�65   ���	#FF49AEE8
�������$��1��5�   I   $��2��6V   $��2��6f   $��Right=�6z   ��5�   @   �� *EditCommand+.��5�      �� $ 
Horizontal=�6%   .+�5�      
  $ ModeEditOutline=�66   $��Stretch=�6M   �� 5�      $��Tính tiền (F8)��6(   6@   5�      5�      5�      5�        5�      $��1��6"   $��2��62   $��Stretch=�6C   $��5q�6_   $	��Top=�6j   .��5�      �� $��
Hóa đơn��6   $��5q�6,   $ Light=�67   .��5�      ]� .+�5�      �� $
��Auto=�6'   $
��Auto=�6L   $	��Top=�6o   .��5�      �� ��6'   �� *ListOutputInfos+ �� Mode$ TwoWay=� 6\   �� *SelectedOutputInfo+$ OneWayToSource=� �� View 5�   "   �� 5�   &   .P�5�   *   �� $��Tên hàng hóa��69    �� DisplayMemberBinding 6O   �� *Object.DisplayName+6�   �� 5�   *   $��Số lượng��69    6K   �� *Count+6t   �� 5�   *   $��Giá tiền��69    6K   �� *InputInfo.OutputPrice+6�   5�   '   5�      5�      5�      5�      5�      5�      5�      5�      