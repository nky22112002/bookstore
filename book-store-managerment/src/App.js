import {AdminLayout, InsertLayout, HomeLayout, InvoiceLayout, RevenueLayout} from './Layout'
import React from 'react';
import { Routes, Route } from 'react-router-dom';


function App() {
    return(
        <div className='App'>
            <Routes>
                <Route path='/insert-book' element={<InsertLayout/>} />
                <Route path='/' element={<HomeLayout/>}/>
                <Route path='/invoice' element={<InvoiceLayout/>}/>
                <Route path='/admin' element={<AdminLayout/>}/>
                <Route path='/revenue' element={<RevenueLayout/>}/>
            </Routes>
        </div>
    );
    
}

export default App;
