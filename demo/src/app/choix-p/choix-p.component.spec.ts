import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ChoixPComponent } from './choix-p.component';

describe('ChoixPComponent', () => {
  let component: ChoixPComponent;
  let fixture: ComponentFixture<ChoixPComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ChoixPComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ChoixPComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
