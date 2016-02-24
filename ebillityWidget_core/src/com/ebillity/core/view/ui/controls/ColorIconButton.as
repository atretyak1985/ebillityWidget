package com.ebillity.core.view.ui.controls
{
	import spark.components.Button;
	[Style( name = "buttonColor", type = "uint", format = "Color", inherit = "yes", theme = "spark, mobile" )]
	[Style(name="buttonIcon", inherit="no", type="*")]
	public class ColorIconButton extends Button
	{
		public function ColorIconButton()
		{
			super();
		}
	}
}