AdminUser.destroy_all
User.destroy_all
Course.destroy_all
Category.destroy_all
Message.destroy_all
Chatroom.destroy_all
Comment.destroy_all

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

# create categories
preparatory = Category.create!(name: 'Preparatory')
core = Category.create!(name: 'Core')
depth = Category.create!(name: 'Depth')

# create user
user = User.create!(email: 'someone@example.com', password: 'password', password_confirmation: 'password')

# create courses
Course.create(
  user_id: user.id,
  category_id: preparatory.id,
  name: 'Computer Science 1',
  description: 'This course provides an introduction to programming using the Standard C++ programming language.  Students learn the basic concepts of assignment, iteration, and looping.  The course includes extensive coverage of objects and the concepts of object-oriented programming.  In addition, students will learn how to effectively structure a program.'
)


Course.create(
  user_id: user.id,
  category_id: preparatory.id,
  name: 'Operating Systems',
  description: 'This course examines basic operating system concepts and principles. The concepts include Operating Systems components, architecture, and management. Operating system management will examine process, memory, storage, and security management. Several exercises and hands-on activity reinforce the concepts and principles covered in the course. Course Entry Requirement: IS 306 or CS 306.'
)


Course.create(
  user_id: user.id,
  category_id: preparatory.id,
  name: 'C++ - Intermediate',
  description: 'In this course students further their understanding of the C++ programming language, applying it to the managed code environment, databases and Windows programming. In the first part of the course students use C++/CLI to create managed code. The course then covers designing, implementing and accessing databases to store large data sets. Students then implement Windows based programs using the Microsoft Foundation Classes (MFC). Students will learn the concepts of event-driven programming, message processing, and Windows program structure. Prerequisite: CS 131'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Principles of Software Engineering',
  description: 'The Software Engineering discipline covers those activities used to produce and deliver quality code in a consistent manner. This course covers process models, methodologies and architectures for producing code, as well as the project and configuration management processes to guide the software lifecycle. The course also looks at the critical areas of requirements engineering, documentation and metrics. Students mastering this course will be prepared to participate in professional software engineering teams.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Compilers for Computer Languages',
  description: 'This course focuses on a practical approach for code design and systems architecture requirements when building a compiler and interpreter. Students learn how to build a compiler/interpreter for multiple programming languages using the common resources. During the course, students become familiar with several programming languages as they are intimately tied to the design and implementation of the compiler. Students learn how compilers are used to translate high level source code into machine language. Students will learn all stages involved during the compile cycle. Students will also learn component based software engineering, service orientation and global software development.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Introduction to Cloud Computing',
  description: 'This course focuses on the concepts and programmatic challenges with cloud computing. Cloud computing is a highly scalable and geographically dispersed computing system that has unique design concerns. Cloud computing systems are often not owned by the parent company which requires attention to storage of data and commitment to ethical programming. This course introduces the concepts behind cloud computing, unique programming challenges, and unique communications and ethical concerns for programmers. The student will learn the theoretical and practical design considerations for distributed programming, data use and transport, as well as legal compliance considerations in a cloud computing environment. The student will also learn to present information in a team that is geographically dispersed as part of a software development process.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Computer Architecture',
  description: 'This course provides students with a fundamental understanding of computer architecture and components including the ALU, registers, busses, i/o, memory and caches. Students gain an appreciation for machine and assembly languages and how different architectures are used to address challenges in computing. Students who have completed this course will understand how to use the hardware of a computer effectively.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'C++ for Programmers',
  description: 'The course contents include ANSI/ISO standard C++, control structures, functions, arrays, pointers, strings, class/data abstraction, operator overloading, inheritance, overriding, virtual functions, polymorphism, stream I/O, template, and exception handling. This is the second course in the C++ Programming emphasis of the Master of Science in Computer Systems (MSCS) program. It provides a basic background in both C++ programming and in Object-Oriented programming concepts.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Software Testing',
  description: 'This course looks at the theories and practical tools and techniques for the testing and validation of software. Testing includes unit, integration, regression and user acceptance testing using both black-box and white-box techniques. The course also covers developing and writing test cases, creating error reports, and tracking test status. Upon completion of the course the student should be comfortable designing and applying requirements to software systems testing.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Data Exploration and Visualization',
  description: 'Please check back soon for the full description.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Managing the Technology Project',
  description: 'Project management has become a foundational skill for all business and technology managers. This course will explore the unique challenges of managing projects with technology enablers. The student will study and apply best practices in project management including planning, scheduling, managing cost, quality, and risk, while monitoring the external and internal influences that can affect project scope and eventual success with integrating technology into the business environment. The challenges of working with diverse teams of business experts, as well as project management, has become a foundational skill for all business and technology managers. This course will explore the challenges of managing technology projects. The students will study and apply best practices in project management including planning, scheduling, and managing procurements, cost, quality and risk.'
)

Course.create(
  user_id: user.id,
  category_id: core.id,
  name: 'Technology Implementation and Change',
  description: 'This course presents the challenge of implementing technology in an organizational environment. Topics will include the principles of systems thinking, the process of transition at the individual and organizational level, and the dynamic nature of working in a distributed collaborative environment. You will propose a technology, assess an organization\'s readiness for change and develop a plan for addressing potential obstacles as part of a transition management plan. Rather than working independently, you will be placed in roles on a multi-functional implementation team and challenged to integrate your plans with your classmates in a virtual environment. You will emerge from this course with an increased appreciation of the many factors that influence the success of technology adoption and the ability to collaborate as members of transition management teams to ensure successful implementations.'
)

Course.create(
  user_id: user.id,
  category_id: depth.id,
  name: 'Information Security Overview',
  description: 'This course will cover changes in information security management and understanding. The age of information security as technology alone has passed, people currently involved with information security need to understand the entire information security landscape, from rules, laws, corporate laws and rules, decision making, working in teams, leadership, and other ways that information security is changing people and the work place.'
)

Course.create(
  user_id: user.id,
  category_id: depth.id,
  name: 'System Administration for Information Security',
  description: 'In this course students discuss security implementations for digital networks, platforms, and applications. Areas of study involve identifying and examining security risks, security solutions and tools available for various Windows platforms and applications.'
)

Course.create(
  user_id: user.id,
  category_id: depth.id,
  name: 'Ethical Obligations in Information Security',
  description: 'This course is a study of the ethical issues that arise in information security. The course explores ethical frameworks and their application to particular areas influencing and affecting information security. Topics explored include privacy, anonymity, confidentiality, intellectual property and other areas impacted by information and communications technology. Students completing the course will be aware of the many issues they can expect to confront, understand how others have addressed similar issues, and possess a toolkit to aid them as they confront those issues.'
)

Course.create(
  user_id: user.id,
  category_id: depth.id,
  name: 'Computer Science Capstone',
  description: 'The Computer Science Capstone is the capstone course for the Master of Science in Computer Science (MSCS) program. Students will demonstrate their ability to apply computer systems principles, tools, and techniques to a specific problem or research study, and to acquire and/or apply additional knowledge in a unique domain. This course integrates knowledge gained from previous coursework in the MSCS program. Prerequisite: Final quarter of study'
)
