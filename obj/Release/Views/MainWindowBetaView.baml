   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  -    'QuanLyKho_MVVM.Views.MainWindowBetaView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  (ucclr-namespace:QuanLyKho_MVVM.UC  .local"clr-namespace:QuanLyKho_MVVM.Views  -   $��mainView��  � WindowStartupLocation$  CenterScreen=� � WindowStyle$
 None=�$��20(� � 
ResizeMode$ NoResize=�   
MainBetaVM � DataContext# [   � Title$ MainWindowBetaView��$	��900��$
��1000��.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+	   CommandParameter	 �� 
 �� ElementName$
 mainView��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�(  "MaterialDesignThemes.Wpf.ColorZone     Mode$ Light=�   CornerRadius$ 3��+  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth3=�$��2q�$
��Left=�$��Stretch=�.��9� -   $��ExMain�� 9� ExpandDirection$
 Left=����� $
��Wrap=�$��Chức năng��.���� .����  � 	Resources  �� 
TargetType # MaterialDesignRaisedLightButton �� BasedOn �� Property �� Value��%x   '��       7  �� " ��8   .���  � ��$ 75����  � ��$	 125����  � ��$ 5q���  � ��$ 20(�.+��� -   $��Trang chủ���� -   $��
Nhập kho���� -   $��
Xuất kho���� -   .���� $
��Wrap=�$��Khách hàng���� -   .���� $
��Wrap=�$��Nhà cung cấp���� -   .���� .+��� $��
Đơn vị���� -	   .���� .+��� $��Mặt hàng��#  MaterialDesignThemes.Wpf.Card  $��Stretch=�$��Stretch=�.��)	  #MaterialDesignThemes.Wpf.DialogHost	   	  
Identifier$
 Root��.��>� -
    >�Name$ UCSpace��