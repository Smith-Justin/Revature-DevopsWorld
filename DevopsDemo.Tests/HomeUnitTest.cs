using DevopsDemo.Client.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace DevopsDemo.Tests
{
    public class HomeUnitTest
    {
        [Fact]
        public void Test_Index()
        {
            //sut - Subject Under Test
            var sut = new HomeController();

            var view = sut.Index();

            Assert.NotNull(sut);
            Assert.IsType<ViewResult>(view);
        }

        [Fact]
        public void Test_Privacy()
        {
            //sut - Subject Under Test
            var sut = new HomeController();

            var view = sut.Privacy();

            Assert.NotNull(sut);
        }
    }
}