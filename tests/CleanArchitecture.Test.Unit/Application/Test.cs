using FluentAssertions;
using Xunit;

namespace CleanArchitecture.Test.Unit.Application
{
    public class Test
    {
        [Fact]
        public void DummyTest()
        {
            "abc".Should().Be("abc");
        }
    }
}