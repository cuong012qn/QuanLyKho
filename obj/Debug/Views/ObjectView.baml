   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5   	   ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5	   	   %    QuanLyKho_MVVM.Views.ObjectView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (ucclr-namespace:QuanLyKho_MVVM.UC  5   	   .local"clr-namespace:QuanLyKho_MVVM.Views  5	   	   -   5        $��
objectView��5   	   $��20(�5   	     � Title$  Thông tin khách hàng��5   	   $	��800��6&   $	��800��63      ObjectVM � DataContext# [  5   	    � WindowStyle$
 None=�5       � 
ResizeMode$ NoResize=�6.    � WindowStartupLocation$ CenterScreen=�5   	   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedCommand+	   CommandParameter	 5   $   �� 
 �� ElementName$
 
objectView��5       J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   .��5      ]� .+�5   
      QuanLyKho_MVVM.UC.UCBar  $	��Top=�6   
 � Tag 6(   �� *Title+$
 
objectView��6W   �� 5   
   
����d�$��2q�6.   $��5q�6B   $	��Top=�6M   ._�5      �� $��Thông tin khách hàng��6   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�65   .��5      ]� .+�5       � $	��Top=�6    � ColumnDefinitions 5!      �� 5"      61   �� 5#      61    � RowDefinitions 5%      �� 5&      6.   �� 5'      6.   �� 5(      6.   .+�5*      � $��5q�6   .+�5+      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$
 Tên��6&    % !MaterialDesignFloatingHintTextBox#��[ 6K   ��5,   &   �� *DisplayName+5-      � 5.      $��0��6   $��1��6/   $��5q�6<   .+�5/      �� $ 
Đơn vị��6'    �� DisplayMemberPath$ DisplayName��51   '    & "MaterialDesignFloatingHintComboBox#��[ 6G   ��5/   O   �� *
ListUnit+ �� SelectedItem 50   '   �� *SelectedUnit+52      53      � 54      $��1��6   $��1��6/   $��5q�6<   .+�55      �� $ Nhà cung cấp��6'   #��[ 6U   $ DisplayName��57   L    56   '   �� *SelectedSupplier+��57   '   �� *ListSupplier+58      59      � 5:      $��5q�6   $��2��6*   .+�5;      �� $ QRCode��6&   #��[ 6N   ��5<   &   �� *QrCode+5=      � 5>      $��5q�6   $��2��6*   $��1��67   .+�5?      �� $ BarCode��6&   #��[ 6O   ��5@   &   �� *	BarCode+5A      5B      �� 5C      $��1��6!   $��1��61    �� Orientation$ 
Horizontal=�6>   $��Right=�6W   $��0 10 0 0q�6s   .+�5D      �� $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *
AddCommand+.��5E      �� $ 
Horizontal=�6)   .+�5F   "   '  !MaterialDesignThemes.Wpf.PackIcon  �	  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 	  Kind$	 Add=�6:   $��Stretch=�6E   �� 5G   "   
Thêm (F5)67   5H      5I      �� 5J      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *DeleteCommand+.��5K      �� $ 
Horizontal=�6)   .+�5L   "     $ Delete=�6:   $��Stretch=�6H   �� 5M   "   $��	Xóa (F6)��6,   6>   5N      5O      �� 5P      $��50��6!   $	��115��6-   $��2q�69   ���	#FF49AEE8
���������6D   �� *EditCommand+.��5Q      �� $ 
Horizontal=�6)   .+�5R   "     $ ModeEditOutline=�6:   $��Stretch=�6Q   �� 5S   "   $��
Sửa (F7)��6,   6>   5T      5U      5V      5W      5X      5Y      �� 5Z   
   $��1��6   
����d�$��2q�6;   $��5q�6O   ._�5[      �� -   5         ��Name$ scrollViewer��5[   3   $��1��6   $��5q�6(   .��5\      �� ��6   �� *
ListObject+ �� Mode$ TwoWay=� 6K   �� *SelectedObject+$ OneWayToSource=� �� View 5]      �� 5^      .P�5_      �� $
��Tên��6-    �� DisplayMemberBinding 6:   �� *DisplayName+6i   �� 5`      $��
Đơn vị��6-    6=   �� *Unit.DisplayName+6q   �� 5a      $��Nhà cung cấp��6-    6C   �� *Supplier.DisplayName+6{   �� 5b      $��QRCode��6-    6=   �� *QRCode+6g   �� 5c      $��BarCode��6-    6>   �� *	BarCode+6i   5d      5f      5g      5h      5i      5j      