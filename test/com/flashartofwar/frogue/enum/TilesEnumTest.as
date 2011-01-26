package com.flashartofwar.frogue.enum 
{
	import org.flexunit.Assert;

	/**
	 * @author jessefreeman
	 */
	public class TilesEnumTest 
	{
		[Test]
		public function isSupported():void
		{
			Assert.assertTrue(TilesEnum.isSupported("#"));
		}
		
		[Test]
		public function isNotSupported():void
		{
			Assert.assertFalse(TilesEnum.isSupported("√"));
		}
		
		[Test]
		public function isImpassable():void
		{
			Assert.assertTrue(TilesEnum.isImpassable("#"));
		}
		
		[Test]
		public function isNotImpassable():void
		{
			Assert.assertFalse(TilesEnum.isImpassable("_"));
		}

		
	}
}
