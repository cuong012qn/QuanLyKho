   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5   	   5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5   	   $    QuanLyKho_MVVM.Views.InputView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:QuanLyKho_MVVM.Views     5   	   .ucclr-namespace:QuanLyKho_MVVM.UC     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5        $��	inputView��5   	   $��20(�5   	      InputVM  � DataContext#  [  5   	    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�6    � WindowState$ 	Maximized=�5   	    � Title$ Phiếu nhập hàng hóa��5   	   $	��850��6%   $	��850��62    J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   .  (System.Windows.Interactivity.Interaction	   Triggers	 5      /  )System.Windows.Interactivity.EventTrigger  5   
   
   	EventName$
 Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ 	inputView��5      .��5      ]� .+�5   
      QuanLyKho_MVVM.UC.UCBar  $	��Top=�6?   
 � Tag 6   �� *Title+$ 	inputView��6V   #  MaterialDesignThemes.Wpf.Card  5   
   $��0��6   $��Stretch=�6+   $��5q�6G   $��1��6R   $	��Top=�6c   .��5       �� $��Phiếu nhập��6   $��5q�6+   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�66   .��5!      �  � ColumnDefinitions 5"      �� 5#      6-   �� 5$      6-    � RowDefinitions 5&      �� 5'      6*   �� 5(      6*   �� 5)      6*   �� 5*      6*   �� 5+      6*   .+�5/      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên hàng hóa��6   $��1��6M   $��0��6]   $��5q�6j    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 50   5    �� DisplayMemberPath$ DisplayName��52   #   ��51   #   �� *
ListObject+ �� SelectedItem 6F   �� *SelectedObject+53      �� 54      $ Nhà cung cấp��6   {�.  $��0��55      $��0��6-   $��5q�6:    % !MaterialDesignFloatingHintTextBox#��[ 56      ��55   E   �� *%#SelectedObject.Supplier.DisplayName+56      �� 59      $ Số lượng��6   $��0��6H   $��1��6X   $��5q�6e   #��[ 5;      ��5:      �� *Count+5;      �� 5>      $ Tình trạng��6   $��0��6J   $��3��6Z   $��5q�6g   #��[ 5?      {�.  ��5@      �� *Status+66   (	  "System.Windows.Controls.DatePicker	  5A      $ Ngày nhập��6!   $��1��6L   $��3��6\   $��5q�6i    ( $MaterialDesignFloatingHintDatePicker#��[ 5B       	  SelectedDate 5C   !   �� *	DateInput+�� 5F      $ Giá nhập��6   $��0��6H   $��2��6X   $��5q�6e   #��[ 5G      ��5H      �� *
InputPrice+�� 5I      $ 	Giá bán��6   $��1��6G   $��2��6W   $��5q�6d   #��[ 5K      ��5J      �� *OutputPrice+5K      �� 5L      $��1��6!   $��4��61    �� Orientation$ 
Horizontal=�6>   $��Right=�6W   $��0 10 0 0q�6s   .+�5M      �� $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *
AddCommand+.��5N      �� $ 
Horizontal=�6)   .+�5O   "   '
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�6:   $��Stretch=�6E   �� 5P   "   
Thêm (F5)67   5Q      5R      �� 5S      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *DeleteCommand+.��5T      �� $ 
Horizontal=�6)   .+�5U   "   
  $ Delete=�6:   $��Stretch=�6H   �� 5V   "   $��	Xóa (F6)��6,   6>   5W      5X      �� 5Y      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *EditCommand+.��5Z      �� $ 
Horizontal=�6)   .+�5[   "   
  $ ModeEditOutline=�6:   $��Stretch=�6Q   �� 5\   "   $��
Sửa (F7)��6,   6>   5]      5^      5_      5`      5a      5b        5c   
   $��Stretch=�6   $	��Top=�6:   $��5q�6O   .��5d      �� $ Tìm kiếm hàng��6   $��5q�6�   ��6E   �� *Search+ �� UpdateSourceTrigger$ PropertyChanged=�6�   5e        5f   
   $��Stretch=�6   $��5q�6:   $��Bottom=�6E   .��5g      �  5h      �� 5i      6)   �� 5j      6)   �� 5k      6)   �� 5l      6)   .+�5n      �� $ Tổng số lượng��6   {�.  $��5q�6[   ��6f   �� *
SumCount+�� 5o      $ Tổng tiền nhập��6   {�.  $��1��6\   $��5q�6l   ��6w   �� *SumInputPrice+5p      5q        5r   
   $��1��6   $��2��6.   $��Stretch=�6?   $��5q�6[   $	��Top=�6f   .��5s      �� $��Thống kê��6   $��5q�6)   $ Light=�64   .��5t      ]� .+�5u      �� $
��Auto=�6#   $
��Auto=�6H   $	��Top=�6k   .��5v      �� ��6#   �� *ListInputInfos+ �� Mode$ TwoWay=� 5w   #   �� *SelectedInputInfo+$ OneWayToSource=� �� View 5y      �� 5z   "   .P�5{   &   �� $��Tên hàng hóa��65    �� DisplayMemberBinding 6K   �� *Object.DisplayName+6�   �� 5|   &   $��Số lượng��65    6G   �� *Count+6p   �� 5}   &   $��Giá nhập��65    6G   �� *
InputPrice+6u   �� 5~   &   $��	Giá bán��65    6F   �� *OutputPrice+6u   �� 5   &   $��Tình trạng��65    6I   �� *Status+6s   �� 5�   &   $��
Ngày bán��65    6G   �� *Input.DateInput+6z   5�   #   5�      5�      5�      5�      5�      5�      5�      