   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5      ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5	      '    !QuanLyKho_MVVM.Views.ObjectUCView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      (ucclr-namespace:QuanLyKho_MVVM.UC  5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      .local"clr-namespace:QuanLyKho_MVVM.Views  5	      -   5        $��
objectUCVM��5
      $��20(�5         
ObjectUCVM  � DataContext#  [  6-   
�������.  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ 
objectUCVM��5       J� InputBindings 5      �� 5   
   
 �� Key$ F5��64   	 �� Command	 6   �� *
AddCommand+6?   �� 5   
   $ F6��67   	 6   �� *DeleteCommand+6B   �� 5   
   $ F7��65   	 6   �� *EditCommand+6@   .��5      ]� .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��5q�6   $	��Top=�6)   .��5      9� $��Nhập loại mặt hàng��6   .  (MaterialDesignThemes.Wpf.ColorZoneAssist
   Mode$
 Light=�63   .��5      ]� .+�5      � $	��Top=�6    � ColumnDefinitions 5      �� 5      61   �� 5      61    � RowDefinitions 5!      �� 5"      6.   �� 5#      6.   �� 5$      6.   .+�5&      � $��5q�6   .+�5'      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$
 Tên��6&    % !MaterialDesignFloatingHintTextBox#��[ 6K   ��5(   &   �� *DisplayName+5)      � 5*      $��0��6   $��1��6/   $��5q�6<   .+�5+      �� $ 
Đơn vị��6'    �� DisplayMemberPath$ DisplayName��5-   '    & "MaterialDesignFloatingHintComboBox#��[ 6G   ��5+   O   �� *
ListUnit+ �� SelectedItem 5,   '   �� *SelectedUnit+5.      5/      � 50      $��1��6   $��1��6/   $��5q�6<   .+�51      �� $ Nhà cung cấp��6'   #��[ 6U   $ DisplayName��53   L    52   '   �� *SelectedSupplier+��53   '   �� *ListSupplier+54      55      � 56      $��5q�6   $��2��6*   .+�57      �� $ QRCode��6&   #��[ 6N   ��58   &   �� *QrCode+59      � 5:      $��5q�6   $��2��6*   $��1��67   .+�5;      �� $ BarCode��6&   #��[ 6O   ��5<   &   �� *	BarCode+5=      5>      �� 5?      $��1��6!   $��1��61    �� Orientation$ 
Horizontal=�6>   $��Right=�6W   $��0 10 0 0q�6s   .+�5@      �� $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *
AddCommand+.��5A      �� $ 
Horizontal=�6)   .+�5B   "   '  !MaterialDesignThemes.Wpf.PackIcon  �	  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 	  Kind$	 Add=�6:   $��Stretch=�6E   �� 5C   "   
Thêm (F5)67   5D      5E      �� 5F      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *DeleteCommand+.��5G      �� $ 
Horizontal=�6)   .+�5H   "     $ Delete=�6:   $��Stretch=�6H   �� 5I   "   $��	Xóa (F6)��6,   6>   5J      5K      �� 5L      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *EditCommand+.��5M      �� $ 
Horizontal=�6)   .+�5N   "     $ ModeEditOutline=�6:   $��Stretch=�6Q   �� 5O   "   $��
Sửa (F7)��6,   6>   5P      5Q      5R      5S      5T      5U        5V   
   $��5q�6   $��Stretch=�6)   $��Stretch=�6E   .��5W      �� -   5         ��Name$ scrollViewer��5W   3   $��1��6   $��5q�6(   .��5X      �� ��6   �� *
ListObject+ �� Mode$ TwoWay=� 6K   �� *SelectedObject+$ OneWayToSource=� �� View 5Y      �� 5Z      .P�5[      �� $
��Tên��6-    �� DisplayMemberBinding 6:   �� *DisplayName+6i   �� 5\      $��
Đơn vị��6-    6=   �� *Unit.DisplayName+6q   �� 5]      $��Nhà cung cấp��6-    6C   �� *Supplier.DisplayName+6{   �� 5^      $��QRCode��6-    6=   �� *QRCode+6g   �� 5_      $��BarCode��6-    6>   �� *	BarCode+6i   5`      5b      5c      5d      5e      5f      