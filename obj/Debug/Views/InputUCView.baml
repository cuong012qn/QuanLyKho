   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5      ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5	      &     QuanLyKho_MVVM.Views.InputUCView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      (ucclr-namespace:QuanLyKho_MVVM.UC  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      .local"clr-namespace:QuanLyKho_MVVM.Views  5	      -   5          >�Name$  	inputUCVM��5
      $��20(�6!   
�������   	InputUCVM � DataContext# [  5       J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+	   CommandParameter	 5   $   �� 
 �� ElementName$
 	inputUCVM��5      .��5      ]� .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��0��6   $��Stretch=�6+   $��5q�6G   $��1��6R   $	��Top=�6c   .��5      9� $��Phiếu nhập��6   $��5q�6+   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�66   .��5      �  � ColumnDefinitions 5      �� 5      6-   �� 5      6-    � RowDefinitions 5      �� 5       6*   �� 5!      6*   �� 5"      6*   �� 5#      6*   �� 5$      6*   .+�5(      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên hàng hóa��6   $��1��6M   $��0��6]   $��5q�6j    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 5)   5    �� DisplayMemberPath$ DisplayName��5+   #   ��5*   #   �� *
ListObject+ �� SelectedItem 6F   �� *SelectedObject+5,      �� 5-      $ Nhà cung cấp��6   {�.  $��0��5.      $��0��6-   $��5q�6:    % !MaterialDesignFloatingHintTextBox#��[ 5/      ��5.   E   �� *%#SelectedObject.Supplier.DisplayName+5/      �� 52      $ Số lượng��6   $��0��6H   $��1��6X   $��5q�6e   #��[ 54      ��53      �� *Count+54      �� 57      $ Tình trạng��6   $��0��6J   $��3��6Z   $��5q�6g   #��[ 58      {�.  ��59      �� *Status+66   (  "System.Windows.Controls.DatePicker  5:      $ Ngày nhập��6!   $��1��6L   $��3��6\   $��5q�6i    ( $MaterialDesignFloatingHintDatePicker#��[ 5;         SelectedDate 5<   !   �� *	DateInput+�� 5?      $ Giá nhập��6   $��0��6H   $��2��6X   $��5q�6e   #��[ 5@      ��5A      �� *
InputPrice+�� 5B      $ 	Giá bán��6   $��1��6G   $��2��6W   $��5q�6d   #��[ 5D      ��5C      �� *OutputPrice+5D      �� 5E      $��1��6!   $��4��61    �� Orientation$ 
Horizontal=�6>   $��Right=�6W   $��0 10 0 0q�6s   .+�5F      �� $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *
AddCommand+.��5G      �� $ 
Horizontal=�6)   .+�5H   "   '	  !MaterialDesignThemes.Wpf.PackIcon	  �
  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 
  Kind$	 Add=�6:   $��Stretch=�6E   �� 5I   "   
Thêm (F5)67   5J      5K      �� 5L      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *DeleteCommand+.��5M      �� $ 
Horizontal=�6)   .+�5N   "   	  $ Delete=�6:   $��Stretch=�6H   �� 5O   "   $��	Xóa (F6)��6,   6>   5P      5Q      �� 5R      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *EditCommand+.��5S      �� $ 
Horizontal=�6)   .+�5T   "   	  $ ModeEditOutline=�6:   $��Stretch=�6Q   �� 5U   "   $��
Sửa (F7)��6,   6>   5V      5W      5X      5Y      5Z      5[        5\   
   $��Stretch=�6   $	��Top=�6:   $��5q�6O   .��5]      �� $ Tìm kiếm hàng��6   $��5q�6�   ��6E   �� *Search+ �� UpdateSourceTrigger$ PropertyChanged=�6�   5^        5_   
   $��Stretch=�6   $��5q�6:   $��Bottom=�6E   .��5`      �  5a      �� 5b      6)   �� 5c      6)   �� 5d      6)   �� 5e      6)   .+�5g      �� $ Tổng số lượng��6   {�.  $��5q�6[   ��6f   �� *
SumCount+�� 5h      $ Tổng tiền nhập��6   {�.  $��1��6\   $��5q�6l   ��6w   �� *SumInputPrice+5i      5j        5k   
   $��1��6   $��2��6.   $��Stretch=�6?   $��5q�6[   $	��Top=�6f   .��5l      �� $��Thống kê��6   $��5q�6)   $ Light=�64   .��5m      ]� .+�5n      �� $
��Auto=�6#   $
��Auto=�6H   $	��Top=�6k   .��5o      �� ��6#   �� *ListInputInfos+ �� Mode$ TwoWay=� 5p   #   �� *SelectedInputInfo+$ OneWayToSource=� �� View 5r      �� 5s   "   .P�5t   &   �� $��Tên hàng hóa��65    �� DisplayMemberBinding 6K   �� *Object.DisplayName+6�   �� 5u   &   $��Số lượng��65    6G   �� *Count+6p   �� 5v   &   $��Giá nhập��65    6G   �� *
InputPrice+6u   �� 5w   &   $��	Giá bán��65    6F   �� *OutputPrice+6u   �� 5x   &   $��Tình trạng��65    6I   �� *Status+6s   �� 5y   &   $��
Ngày bán��65    6G   �� *Input.DateInput+6z   5z   #   5|      5}      5~      5      5�      5�      5�      