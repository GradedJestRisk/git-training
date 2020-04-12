const chai = require('chai');
chai.should();

it('pass', () => {
  true.should.be.true;
})


it('also pass', () => {
  true.should.be.true;
})


it('fails ! red commit !', () => {
  true.should.be.false;
})

