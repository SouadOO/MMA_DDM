# Metro Mobile Application's Distributed data management layer (MMA_DDM) 

The reference domain concerns a Metro public transportation service. In this context, we are
interested in a mobile application that works as a data recorder for vehicles. 

The application uses mobile data connections to send information to servers in real time. Data are stored and are not
managed as a stream. The information includes measurements such as the location and speed of the vehicles. 

Typical workloads mix together write and read operations. The aim of this project is the
design and the implementation of the distributed data management layer for the mobile application.

To this aim, we choose **Cassandra** as reference technology and we rely on CQL for workload
implementation. Our mobile application needs workload both read and write operations. Cassandra
provides very good performance for both kinds of operations.

The mobile application needs a database containing data about drivers, railway vehicles, time
table, availability of drivers and vehicles, and current position and speed of vehicles (Data Point).

The deployment of the application and the test database should involve a cluster of machines.
The infrastructure team has agreed to the following Availability requirements: 

         • a Strong Availability for 100% of the data must be provided when one node is down.

The product team has agreed to the following consistency requirements:

       • Reading driver and vehicle data must be strongly consistent;
       • Reading Data Point and other data may be eventually consistent.
    
We started by desgning the conceptual schema of this problem, then identifying its workload, and based on the results of this two steps 
and cassendra specification we will deseign the logical schema using query-driven design.

The main parts of this project are:

      - 1: Database layer design   (see presentation file)
      - 2: Dataset generation based on real information of London metro (see data generation folder)
      - 3: Implementation of required workload usin CQL (see CQL_implementation folder).

