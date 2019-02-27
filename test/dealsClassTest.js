const expect = chai.expect;
describe('index.js', () => {
  it('can test stuff', () => {
    expect("hello").to.be.instanceof(String);
  });
})