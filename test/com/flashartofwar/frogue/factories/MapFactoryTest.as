package com.flashartofwar.frogue.factories 
{

	import org.flexunit.Assert;
	/**
	 * @author jessefreeman
	 */
	public class MapFactoryTest 
	{
		public function MapFactoryTest() {
			
		}
		
		[Test]
		public function testCreateRandomMap():void
		{
			Assert.assertNotNull(MapFactory.createRandomMap(5));
		}
	}
}
