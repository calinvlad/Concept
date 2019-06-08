import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  server = 'http://localhost:8000'
  adminId = JSON.parse(localStorage.getItem('admin')).adminId

  constructor(
    private http: HttpClient
  ) { }

  list(): Observable<any> {
    return this.http.get(`${this.server}/products/list`)
  }

  edit(data) {
    return this.http.put(`${this.server}/products/update/${data.productId}?adminId=${this.adminId}`, data)
  }

  delete(id) {
    return this.http.delete(`${this.server}/products/delete/${id}`)
  }

}
