import { testTemplatePage } from './app.po';

describe('test App', function() {
  let page: testTemplatePage;

  beforeEach(() => {
    page = new testTemplatePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
