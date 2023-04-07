import React from "react";
import About from "./About";
import Contact from "./Contact";
import Navbar from "./Navbar";
import Projects from "./Projects";
import Skills from "./Skills";

function Home() { 
    return ( 
        <main>
          <Navbar />
          <About />
          <Projects />
          <Skills />
          <Contact />
        </main>
    ); 
} 
export default Home; 
