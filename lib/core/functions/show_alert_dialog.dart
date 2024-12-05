part of 'functions.dart';


extension ShowAlertDialog on  Functions
{
  Future<dynamic> showAlertDialog(BuildContext context, bool state, String message) 
  {
    final String title = state? 
      'تمت العملية بنجاح!' : 
      'حدث خطأ ما!';

    final TextStyle style = state?
      StylesConsts.dialogTitle :
      StylesConsts.errorDialogTitle;

    final Icon icon = state? 
      const Icon(Iconsax.tick_circle, size: 32, color: AppColors.lightNavyColor) : 
      Icon(Iconsax.info_circle, size: 32, color: AppColors.errorColor);

    final ButtonStyle buttonStyle = state?
      TextButton.styleFrom
      (
        backgroundColor: AppColors.midNavyColor.withOpacity(.2),
        foregroundColor: AppColors.midNavyColor 
      ) :
      TextButton.styleFrom
      (
        backgroundColor: AppColors.errorColor.withOpacity(.2),
        foregroundColor: AppColors.errorColor
      );

    return showDialog(context: context, builder: (context)=>
      AlertDialog
      (
        title: Row(
          children: 
          [
            icon,
            8.spaceW,
            Text(title, style: style,),
          ],
        ),
        content: Text(message),
        actions: 
        [
          TextButton(onPressed: (){context.pop();},
          style: buttonStyle,
          child: const Text('موافق'),
          )
        ],
      )
    );
  }
}