import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {LoginComponent} from "./pages/Authentication/login/login.component";
import {RegisterComponent} from "./pages/Authentication/register/register.component";
import {ProductsComponent} from "./pages/products/products.component";
import {CheckoutComponent} from "./pages/checkout/checkout.component";

const routes: Routes = [];



const routes: Routes = [
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'products',
    component: ProductsComponent
  },
  {
    path: 'checkout',
    component: CheckoutComponent
  }
]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule {}
