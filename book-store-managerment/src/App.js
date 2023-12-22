import {InsertLayout} from './Layout'
import {HomeLayout} from './Layout'
import {InvoiceLayout} from './Layout'
import React from 'react';
import { Routes, Route } from 'react-router-dom';


function App() {
    return(
        <div className='App'>
            <Routes>
                <Route path='/insert-book' element={<InsertLayout/>} />
                <Route path='/' element={<HomeLayout/>}/>
                <Route path='/invoice' element={<InvoiceLayout/>}/>
            </Routes>
        </div>
    );
    
}

export default App;
