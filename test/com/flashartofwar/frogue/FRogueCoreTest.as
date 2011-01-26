package com.flashartofwar.frogue {

	import flexunit.framework.Assert;
	/**
	 * @author jessefreeman
	 */
	public class FRogueCoreTest {
		
		public function FRogueCoreTest()
		{
			
		}
		
		[Test]
		public function testHelloWorld():void
		{
			var test:String = "HelloWorld";
			Assert.assertEquals(test, "HelloWorld");	
		}
	}
}
