--CQL3--
CREATE KEYSPACE IF NOT EXISTS boodskapks WITH REPLICATION={ 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.jobs
(
    domainkey varchar,
    id varchar,
    name varchar,
    jobtype varchar,
    jobstate varchar,
    joblanguage varchar,
    jobcode varchar,
    instances int,
    systemjob boolean, 
    startonboot boolean,
    restartonchange boolean,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.orgassets
(
    domainkey varchar,
    orgid bigint,
    assetid varchar,
    PRIMARY KEY ((domainkey), orgid, assetid)
)WITH CLUSTERING ORDER BY (orgid ASC, assetid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.orgdevices
(
    domainkey varchar,
    orgid bigint,
    deviceid varchar,
    PRIMARY KEY ((domainkey), orgid, deviceid)
)WITH CLUSTERING ORDER BY (orgid ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.orguserroles
(
    domainkey varchar,
    orgid bigint,
    userid varchar,
    roleid varchar,
    PRIMARY KEY ((domainkey), orgid, userid, roleid)
)WITH CLUSTERING ORDER BY (orgid ASC, userid ASC, roleid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.orgusers
(
    domainkey varchar,
    orgid bigint,
    userid varchar,
    PRIMARY KEY ((domainkey), orgid, userid)
)WITH CLUSTERING ORDER BY (orgid ASC, userid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.orgroles
(
    domainkey varchar,
    orgid bigint,
    id varchar,
    description varchar,
    PRIMARY KEY ((domainkey), orgid, id)
)WITH CLUSTERING ORDER BY (orgid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.organizations
(
    domainkey varchar,
    id bigint,
    name varchar,
    description varchar,
    country varchar,
    state varchar,
    city varchar,
    address varchar,
    zipcode varchar,
    primaryphone varchar,
    locale varchar,
    timezone varchar,
    registeredstamp timestamp,
    updatedstamp timestamp,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.roles
(
    domainkey varchar,
    id varchar,
    description varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.pluginids(
    id uuid,
    sysid uuid,
    type varchar,
    ctxid varchar,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.pluginctx(
    ctxid varchar,
    id uuid,
    sysid uuid,
    PRIMARY KEY (ctxid, id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.idcounters(
    dummy int,
    startid counter,
    PRIMARY KEY (dummy)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domains
(
    domainkey varchar,
    email varchar,
    country varchar,
    state varchar,
    city varchar,
    address varchar,
    zipcode varchar,
    password varchar,
    locale varchar,
    timezone varchar,
    primaryphone varchar,
    registeredstamp timestamp,
    startid bigint,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.linkeddomains
(
    domainkey varchar,
    linkeddomainkey varchar,
    linkedapikey varchar,
    label varchar,
    PRIMARY KEY ((domainkey), linkeddomainkey)
)WITH CLUSTERING ORDER BY (linkeddomainkey ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainkeys
(
    domainkey varchar,
    apikey varchar,
    PRIMARY KEY ((domainkey), apikey)
)WITH CLUSTERING ORDER BY (apikey ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainlicenses
(
    domainkey varchar,
    license blob,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domaindevicegroups
(
    domainkey varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domaindevicegroupmembers
(
    domainkey varchar,
    groupid bigint,
    deviceid varchar,
    PRIMARY KEY ((domainkey), groupid, deviceid)
)WITH CLUSTERING ORDER BY (groupid ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainassetgroups
(
    domainkey varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainassetgroupmembers
(
    domainkey varchar,
    groupid bigint,
    assetid varchar,
    PRIMARY KEY ((domainkey), groupid, assetid)
)WITH CLUSTERING ORDER BY (groupid ASC, assetid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainusergroups
(
    domainkey varchar,
    id bigint,
    name varchar,
    email varchar,
    primaryphone varchar,
    locale varchar,
    timezone varchar,
    workstart int,
    workend int,
    workdays list<int>,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainusergroupmembers
(
    domainkey varchar,
    groupid bigint,
    userid varchar,
    PRIMARY KEY ((domainkey), groupid, userid)
)WITH CLUSTERING ORDER BY (groupid ASC, userid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.users
(
    domainkey varchar,
    id varchar,
    firstName varchar,
    lastName varchar,
    country varchar,
    state varchar,
    city varchar,
    address varchar,
    zipcode varchar,
    password varchar,
    primaryphone varchar,
    locale varchar,
    timezone varchar,
    workstart int,
    workend int,
    workdays list<int>,
    roles list<text>,
    registeredstamp timestamp,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.userdevicegroups
(
    domainkey varchar,
    userid varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), userid, id)
)WITH CLUSTERING ORDER BY (userid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.userdevicegroupmembers
(
    domainkey varchar,
    userid varchar,
    groupid bigint,
    deviceid varchar,
    PRIMARY KEY ((domainkey), userid, groupid, deviceid)
)WITH CLUSTERING ORDER BY (userid ASC, groupid ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.userassetgroups
(
    domainkey varchar,
    userid varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), userid, id)
)WITH CLUSTERING ORDER BY (userid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.userassetgroupmembers
(
    domainkey varchar,
    userid varchar,
    groupid bigint,
    assetid varchar,
    PRIMARY KEY ((domainkey), userid, groupid, assetid)
)WITH CLUSTERING ORDER BY (userid ASC, groupid ASC, assetid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.messagefields(
    domainkey varchar,
    msgid bigint,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((domainkey), msgid, name)
)WITH CLUSTERING ORDER BY (msgid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.messagespecifications(
    domainkey varchar,
    msgid bigint,
    name varchar,
    label varchar,
    description varchar,
    finalized boolean,
    PRIMARY KEY ((domainkey), msgid)
)WITH CLUSTERING ORDER BY (msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.recordfields(
    domainkey varchar,
    msgid bigint,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((domainkey), msgid, name)
)WITH CLUSTERING ORDER BY (msgid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.recordspecifications(
    domainkey varchar,
    msgid bigint,
    name varchar,
    label varchar,
    description varchar,
    PRIMARY KEY ((domainkey), msgid)
)WITH CLUSTERING ORDER BY (msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainrecordfields(
    domainkey varchar,
    msgid varchar,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((domainkey), msgid, name)
)WITH CLUSTERING ORDER BY (msgid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainrecordspecifications(
    domainkey varchar,
    msgid varchar,
    name varchar,
    label varchar,
    description varchar,
    PRIMARY KEY ((domainkey), msgid)
)WITH CLUSTERING ORDER BY (msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.preprocessors
(
    domainkey varchar,
    channel varchar,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), channel)
)WITH CLUSTERING ORDER BY (channel ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainrules
(
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.messagerules
(
    domainkey varchar,
    msgid bigint,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), msgid)
)WITH CLUSTERING ORDER BY (msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.namedrules
(
    domainkey varchar,
    name varchar,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.usernamedrules
(
    domainkey varchar,
    userid varchar,
    name varchar,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), userid, name)
)WITH CLUSTERING ORDER BY (userid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.scheduledrules
(
    domainkey varchar,
    id bigint,
    pattern varchar,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.nodescheduledrules
(
    domainkey varchar,
    id bigint,
    nodeid varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.binaryrules
(
    domainkey varchar,
    type varchar,
    code varchar,
    language varchar,
    description varchar,
    PRIMARY KEY ((domainkey), type)
)WITH CLUSTERING ORDER BY (type ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.templates
(
    domainkey varchar,
    name varchar,
    code varchar,
    language varchar,
    PRIMARY KEY ((domainkey), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.systemtemplates
(
    name varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (name)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.outgoingemails
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    sendor varchar,
    receipents list<varchar>,
    subject varchar,
    content varchar,
    hcontent varchar,
    dsrurl varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sentemails
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    sendor varchar,
    receipents list<varchar>,
    subject varchar,
    content varchar,
    hcontent varchar,
    dsrurl varchar,
    status varchar,
    sentat timestamp,
    response varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.outgoingsms
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    sendor varchar,
    receipent varchar,
    content varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sentsms
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    sendor varchar,
    receipent varchar,
    content varchar,
    status varchar,
    sentat timestamp,
    response varchar,
    sid varchar,
    providerstatus varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.outgoingfcms
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    deviceid varchar,
    fcmtoken varchar,
    subject varchar,
    content varchar,
    notification boolean,
    data varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sentfcms
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    deviceid varchar,
    fcmtoken varchar,
    subject varchar,
    content varchar,
    status varchar,
    sentat timestamp,
    response varchar,
    notification boolean,
    data varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.outgoingvoices
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    toaddress varchar,
    content varchar,
    sendor varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sentvoices
(
    id uuid,
    queuedat timestamp,
    domainkey varchar,
    toaddress varchar,
    content varchar,
    sid varchar,
    status varchar,
    sentat timestamp,
    response varchar,
    providerstatus varchar,
    sendor varchar,
    PRIMARY KEY ((domainkey), queuedat, id)
)WITH CLUSTERING ORDER BY (queuedat DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.usergroups
(
    domainkey varchar,
    userid varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), userid, id)
)WITH CLUSTERING ORDER BY (userid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.usergroupmembers
(
    domainkey varchar,
    ownerid varchar,
    groupid bigint,
    userid varchar,
    PRIMARY KEY ((domainkey), ownerid, groupid, userid)
)WITH CLUSTERING ORDER BY (ownerid ASC, groupid ASC, userid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.assets
(
    domainkey varchar,
    id varchar,
    name varchar,
    description varchar,
    registeredstamp timestamp,
    PRIMARY KEY ((domainkey),id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.assetgroups
(
    domainkey varchar,
    assetid varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), assetid, id)
)WITH CLUSTERING ORDER BY (assetid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.assetgroupmembers
(
    domainkey varchar,
    ownerid varchar,
    groupid bigint,
    assetid varchar,
    PRIMARY KEY ((domainkey), ownerid, groupid, assetid)
)WITH CLUSTERING ORDER BY (ownerid ASC, groupid ASC, assetid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.assetdevices
(
    domainkey varchar,
    assetid varchar,
    deviceid varchar,
    PRIMARY KEY ((domainkey), assetid, deviceid)
)WITH CLUSTERING ORDER BY (assetid ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.deviceassets
(
    domainkey varchar,
    deviceid varchar,
    assetid varchar,
    PRIMARY KEY ((domainkey), deviceid)
)WITH CLUSTERING ORDER BY (deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicecommands
(
    domainkey varchar,
    deviceid varchar,
    id bigint,
    cstamp timestamp,
    target varchar,
    includeme boolean,
    groups set<int>,
    commandtype varchar,
    commandid int,
    models set<varchar>,
    versions set<varchar>,
    jsondata varchar,
    data blob,
    PRIMARY KEY ((domainkey), deviceid, id, cstamp)
)WITH CLUSTERING ORDER BY (deviceid ASC, id DESC, cstamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.fleetcounters(
    domainkey varchar,
    commandid counter,
    firmwareid counter,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicecounters(
    domainkey varchar,
    deviceid varchar,
    corrid counter,
    PRIMARY KEY ((domainkey), deviceid)
)WITH CLUSTERING ORDER BY (deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicemodels
(
    domainkey varchar,
    id varchar,
    version varchar,
    description varchar,
    registeredstamp timestamp,
    PRIMARY KEY ((domainkey), id, version)
)WITH CLUSTERING ORDER BY (id ASC, version DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicemodelnames
(
    domainkey varchar,
    id varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devices
(
    domainkey varchar,
    id varchar,
    name varchar,
    description varchar,
    modelid varchar,
    version varchar,
    password varchar,
    registeredstamp timestamp,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.fcmdevices
(
    domainkey varchar,
    id varchar,
    fcmtoken varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicefriends
(
    domainkey varchar,
    deviceid varchar,
    friendid varchar,
    PRIMARY KEY ((domainkey), deviceid, friendid)
)WITH CLUSTERING ORDER BY (deviceid ASC, friendid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicegroups
(
    domainkey varchar,
    deviceid varchar,
    id bigint,
    name varchar,
    PRIMARY KEY ((domainkey), deviceid, id)
)WITH CLUSTERING ORDER BY (deviceid ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicegroupmembers
(
    domainkey varchar,
    ownerid varchar,
    groupid bigint,
    deviceid varchar,
    PRIMARY KEY ((domainkey), ownerid, groupid, deviceid)
)WITH CLUSTERING ORDER BY (ownerid ASC, groupid ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.reporteddevices
(
    domainkey varchar,
    deviceid varchar,
    lastreported timestamp,
    port int,
    address varchar,
    channel varchar,
    nodeid varchar,
    nodeuid uuid,
    PRIMARY KEY ((domainkey), deviceid)
)WITH CLUSTERING ORDER BY (deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.pendingrawdata(
    id timeuuid,
    receivedstamp timestamp,
    channel varchar,
    mqtttopic varchar,
    nodeid varchar,
    nodeuid uuid,
    port int,
    ipaddress varchar,
    size int,
    data blob,
    processed boolean,
    domainkey varchar,
    deviceid varchar,
    dmodel varchar,
    fwver varchar,
    bin boolean,
    type varchar,
    props varchar,
    ctype varchar,
    mid bigint,
    state varchar,
    sysqueue int,
    reason varchar,
    filename varchar,
    filepath varchar,
    PRIMARY KEY ((id), receivedstamp)
)WITH CLUSTERING ORDER BY (receivedstamp ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.rawdata(
    id timeuuid,
    receivedstamp timestamp,
    channel varchar,
    mqtttopic varchar,
    nodeid varchar,
    nodeuid uuid,
    port int,
    ipaddress varchar,
    size int,
    data blob,
    processed boolean,
    domainkey varchar,
    deviceid varchar,
    dmodel varchar,
    fwver varchar,
    bin boolean,
    type varchar,
    props varchar,
    ctype varchar,
    mid bigint,
    state varchar,
    sysqueue int,
    reason varchar,
    filename varchar,
    filepath varchar,
    PRIMARY KEY ((id), receivedstamp)
)WITH CLUSTERING ORDER BY (receivedstamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.rawmessages(
    domainkey varchar,
    id timeuuid,
    deviceid varchar,
    msgid bigint,
    dmodel varchar,
    fwver varchar,
    receivedstamp timestamp,
    channel varchar,
    nodeid varchar,
    nodeuid uuid,
    port int,
    ipaddress varchar,
    header varchar,
    data varchar,
    PRIMARY KEY ((domainkey), id, deviceid)
)WITH CLUSTERING ORDER BY (id DESC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.messageindex
(
    domainkey varchar,
    id  timeuuid,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.dynamicmessages
(
    domainkey varchar,
    id  timeuuid,
    msgid   bigint,
    deviceid varchar,
    receivedstamp timestamp,
    nodeid varchar,
    nodeuid uuid,
    ipaddress varchar,
    jsondata varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.dynamicstatusmessages
(
    domainkey varchar,
    deviceid varchar,
    msgid   bigint,
    id  timeuuid,
    PRIMARY KEY ((domainkey), deviceid, msgid)
)WITH CLUSTERING ORDER BY (deviceid ASC, msgid ASC);


--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.dynamichistorymessages
(
    domainkey varchar,
    deviceid varchar,
    msgid   bigint,
    id  timeuuid,
    PRIMARY KEY ((domainkey), deviceid, msgid, id)
)WITH CLUSTERING ORDER BY (deviceid ASC, msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.lastreceivedmessages
(
    domainkey varchar,
    msgid   bigint,
    deviceid varchar,
    id  timeuuid,
    PRIMARY KEY ((domainkey), msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.lastreceiveddevicemessages
(
    domainkey varchar,
    deviceid varchar,
    msgid   bigint,
    id  timeuuid,
    PRIMARY KEY ((domainkey), deviceid , msgid)
)WITH CLUSTERING ORDER BY (deviceid ASC, msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.firstreceivedmessages
(
    domainkey varchar,
    msgid   bigint,
    deviceid varchar,
    id  timeuuid,
    PRIMARY KEY ((domainkey), msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.firstreceiveddevicemessages
(
    domainkey varchar,
    deviceid varchar,
    msgid   bigint,
    id  timeuuid,
    PRIMARY KEY ((domainkey), deviceid, msgid)
)WITH CLUSTERING ORDER BY (deviceid ASC, msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.outgoingcommands
(
    domainkey varchar,
    deviceid varchar,
    corrid bigint,
    cstamp timestamp,
    qstamp timestamp,
    sstamp timestamp,
    astamp timestamp,
    status varchar,
    ncode int,
    type varchar,
    channel varchar,
    nodeid varchar,
    nodeuid uuid,
    reportedip varchar,
    reportedport int,
    description varchar,
    data blob,
    PRIMARY KEY ((domainkey), deviceid, corrid, cstamp)
)WITH CLUSTERING ORDER BY (deviceid ASC, corrid DESC, cstamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sentcommands
(
    domainkey varchar,
    deviceid varchar,
    corrid bigint,
    cstamp timestamp,
    qstamp timestamp,
    sstamp timestamp,
    astamp timestamp,
    status varchar,
    ncode int,
    type varchar,
    channel varchar,
    nodeid varchar,
    nodeuid uuid,
    reportedip varchar,
    reportedport int,
    description varchar,
    data blob,
    PRIMARY KEY ((domainkey), deviceid, corrid, cstamp)
)WITH CLUSTERING ORDER BY (deviceid ASC, corrid DESC, cstamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.devicemodelproperties
(
    domainkey varchar,
    name varchar,
    model varchar,
    type varchar,
    value varchar,
    label varchar,
    description varchar,
    PRIMARY KEY ((domainkey), name, model)
)WITH CLUSTERING ORDER BY (name ASC, model ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.deviceproperties
(
    domainkey varchar,
    deviceid varchar,
    name varchar,
    type varchar,
    value varchar,
    label varchar,
    description varchar,
    PRIMARY KEY ((domainkey), deviceid, name)
)WITH CLUSTERING ORDER BY (deviceid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.udpgateways
(
    port int,
    eventloopthreads int,
    enabled boolean,
    decodercode varchar,
    decoderlang varchar,
    PRIMARY KEY (port)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.emailgateways
(
    domainkey varchar,
    host varchar,
    port int,
    user varchar,
    password varchar,
    ssl boolean,
    tls boolean,
    debug boolean,
    name varchar,
    primaryemail varchar,
    bounceemail varchar,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.twiliogateways
(
    domainkey varchar,
    sid varchar,
    authtoken varchar,
    primaryphone varchar,
    debug boolean,
    countryphones map<varchar,varchar>,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.fcmgateways
(
    domainkey varchar,
    fcmkey varchar,
    url varchar,
    debug boolean,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.events
(
    domainkey varchar,
    id bigint,
    name varchar,
    subject varchar,
    content varchar,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id asc);


--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.eventregistrations
(
    domainkey varchar,
    eventid bigint,
    channel varchar,
    toaddress varchar,
    PRIMARY KEY ((domainkey), eventid, channel, toaddress)
)WITH CLUSTERING ORDER BY (eventid asc, channel asc, toaddress asc);


--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.fleetgroups
(
    domainkey varchar,
    groupid bigint,
    name varchar,
    PRIMARY KEY ((domainkey), groupid)
)WITH CLUSTERING ORDER BY (groupid asc);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.fleetgroupmembers
(
    domainkey varchar,
    groupid bigint,
    deviceid varchar,
    PRIMARY KEY ((domainkey), groupid, deviceid)
)WITH CLUSTERING ORDER BY (groupid asc, deviceid asc);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.properties
(
    domainkey varchar,
    target varchar,
    targetid varchar,
    name varchar,
    value varchar,
    datatype varchar,
    format varchar,
    label varchar,
    description varchar,
    PRIMARY KEY ((domainkey), target, targetid, name)
)WITH CLUSTERING ORDER BY (target ASC, targetid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.lookup
(
    domainkey varchar,
    target varchar,
    targetid varchar,
    name varchar,
    value varchar,
    type varchar,
    PRIMARY KEY ((domainkey), target, targetid, name)
)WITH CLUSTERING ORDER BY (target ASC, targetid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.geofences
(
    domainkey varchar,
    name varchar,
    group varchar,
    label varchar,
    description varchar,
    type varchar,
    coordinates varchar,
    geometries varchar,
    radius varchar,
    createdat timestamp,
    category1 varchar,
    category2 varchar,
    category3 varchar,
    category4 varchar,
    category5 varchar,
    category6 varchar,
    category7 varchar,
    category8 varchar,
    category9 varchar,
    category10 varchar,
    PRIMARY KEY ((domainkey), name, group)
)WITH CLUSTERING ORDER BY (name ASC, group ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.firmwares
(
    domainkey varchar,
    dmdl varchar,
    fwver varchar,
    description varchar,
    filename varchar,
    contenttype varchar,
    createdat timestamp,
    content blob,
    PRIMARY KEY ((domainkey), dmdl, fwver)
)WITH CLUSTERING ORDER BY (dmdl ASC, fwver DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.otamodelbatches
(
    domainkey varchar,
    state varchar,
    id timeuuid,
    name varchar,
    message varchar,
    frommodel varchar,
    fromversion varchar,
    tomodel varchar,
    toversion varchar,
    expireat timestamp,
    finishedat timestamp,
    PRIMARY KEY ((domainkey), state, id)
)WITH CLUSTERING ORDER BY (state ASC, id DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.otamodelbatchmembers
(
    domainkey varchar,
    id timeuuid,
    state varchar,
    deviceid varchar,
    beginstamp timestamp,
    endstamp timestamp,
    failures int,
    PRIMARY KEY ((domainkey), id, state, deviceid)
)WITH CLUSTERING ORDER BY (id DESC, state ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.otadevicebatches
(
    domainkey varchar,
    state varchar,
    id timeuuid,
    name varchar,
    message varchar,
    tomodel varchar,
    toversion varchar,
    expireat timestamp,
    finishedat timestamp,
    PRIMARY KEY ((domainkey), state, id)
)WITH CLUSTERING ORDER BY (state ASC, id DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.otadevicebatchmembers
(
    domainkey varchar,
    id timeuuid,
    state varchar,
    deviceid varchar,
    beginstamp timestamp,
    endstamp timestamp,
    failures int,
    PRIMARY KEY ((domainkey), id, state, deviceid)
)WITH CLUSTERING ORDER BY (id DESC, state ASC, deviceid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.pendingotas
(
    domainkey varchar,
    type varchar,
    id timeuuid,
    expireat timestamp,
    PRIMARY KEY ((domainkey), type, id)
)WITH CLUSTERING ORDER BY (type ASC, id DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.offlinestreamsessions
(
    domainkey varchar,
    deviceid varchar,
    session varchar,
    beginstamp timestamp,
    PRIMARY KEY ((domainkey), deviceid, session, beginstamp)
)WITH CLUSTERING ORDER BY (deviceid ASC, session ASC, beginstamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.offlinestreams
(
    domainkey varchar,
    deviceid varchar,
    session varchar,
    frame int,
    camera varchar,
    data blob,
    PRIMARY KEY ((domainkey), deviceid, session, frame)
)WITH CLUSTERING ORDER BY (deviceid ASC, session ASC, frame ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.offlinesnaps
(
    domainkey varchar,
    deviceid varchar,
    stamp timeuuid,
    camera varchar,
    mime varchar,
    data blob,
    PRIMARY KEY ((domainkey), deviceid, stamp)
)WITH CLUSTERING ORDER BY (deviceid ASC, stamp DESC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.counters
(
    id int,
    users counter,
    devices counter,
    udpmessages counter,
    mqttmessages counter,
    httpmessages counter,
    fcmmessages counter,
    coapmessages counter,
    tcpmessages counter,
    commands counter,
    domains counter,
    loramessages counter,
    records counter,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domaincounters
(
    domainkey varchar,
    users counter,
    devices counter,
    udpmessages counter,
    mqttmessages counter,
    httpmessages counter,
    fcmmessages counter,
    coapmessages counter,
    tcpmessages counter,
    commands counter,
    loramessages counter,
    records counter,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.tdomaincounters
(
    domainkey varchar,
    users counter,
    devices counter,
    udpmessages counter,
    mqttmessages counter,
    httpmessages counter,
    fcmmessages counter,
    coapmessages counter,
    tcpmessages counter,
    commands counter,
    loramessages counter,
    records counter,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.licensecheck
(
    domainkey varchar,
    data varchar,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.mlmodels
(
    domainkey varchar,
    relation varchar,
    nodeid varchar,
    learningtype varchar,
    classifier varchar,
    predictiontype varchar,
    learningstate varchar,
    trainevery int,
    createdat timestamp,
    trainedat timestamp,
    modelpath varchar,
    PRIMARY KEY ((domainkey), relation)
)WITH CLUSTERING ORDER BY (relation ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.mlmodelattributes
(
    domainkey varchar,
    relation varchar,
    sno int,
    attribute varchar,
    attributetype varchar,
    dateformat varchar,
    nominals set<varchar>,
    PRIMARY KEY ((domainkey), relation, sno, attribute)
)WITH CLUSTERING ORDER BY (relation ASC, sno ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.mlmodeldata
(
    domainkey varchar,
    relation varchar,
    id timeuuid,
    value varchar,
    PRIMARY KEY ((domainkey), relation, id)
)WITH CLUSTERING ORDER BY (relation ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.mlpendingmodeldata
(
    domainkey varchar,
    relation varchar,
    id timeuuid,
    value varchar,
    PRIMARY KEY ((domainkey), relation, id)
)WITH CLUSTERING ORDER BY (relation ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frmodels
(
    domainkey varchar,
    name varchar,
    nodeid varchar,
    algorithm varchar,
    width int,
    height int,
    trainevery int,
    createdat timestamp,
    trainedat timestamp,
    modelpath varchar,
    PRIMARY KEY ((domainkey), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frmodelnodes
(
    nodeid varchar,
    domainkey varchar,
    name varchar,
    PRIMARY KEY ((domainkey), name, nodeid)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frmodelimages
(
    domainkey varchar,
    name varchar,
    label varchar,
    id timeuuid,
    labelid int,
    data blob,
    PRIMARY KEY ((domainkey), name, label, id)
)WITH CLUSTERING ORDER BY (name ASC, label ASC, id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frmodelimagelabels
(
    domainkey varchar,
    name varchar,
    label varchar,
    labelid int,
    PRIMARY KEY ((domainkey), name, label)
)WITH CLUSTERING ORDER BY (name ASC, label ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frmodelimageids
(
    domainkey varchar,
    name varchar,
    labelid int,
    label varchar,
    PRIMARY KEY ((domainkey), name, labelid)
)WITH CLUSTERING ORDER BY (name ASC, labelid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.frpredictionimages
(
    id timeuuid,
    domainkey varchar,
    data blob,
    PRIMARY KEY ((domainkey), id)
)WITH default_time_to_live=1800 AND CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.globaldata
(
    id timeuuid,
    domainkey varchar,
    data varchar,
    PRIMARY KEY ((id), domainkey)
)WITH CLUSTERING ORDER BY (domainkey ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainnodes
(
    domainkey varchar,
    nodeid varchar,
    PRIMARY KEY (domainkey)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.nodedomains
(
    nodeid varchar,
    domainkey varchar,
    PRIMARY KEY ((nodeid), domainkey)
)WITH CLUSTERING ORDER BY (domainkey ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.opencvormodels
(
    domainkey varchar,
    model varchar,
    nodeid varchar,
    description varchar,
    state varchar,
    PRIMARY KEY ((domainkey), model, nodeid)
)WITH CLUSTERING ORDER BY (model ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.opencvormodelcascades
(
    domainkey varchar,
    model varchar,
    label varchar,
    description varchar,
    color varchar,
    fontface int,
    fontscale double,
    scalefactor double,
    minneighbours int,
    flags int,
    minsize varchar,
    maxsize varchar,
    overlaytype varchar,
    overlaytext boolean,
    minscore double,
    cascadesize int,
    data blob,
    PRIMARY KEY ((domainkey), model, label)
)WITH CLUSTERING ORDER BY (model ASC, label ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.tensorflowormodels
(
    domainkey varchar,
    model varchar,
    nodeid varchar,
    description varchar,
    state varchar,
    fontface int,
    fontscale double,
    overlaytype varchar,
    overlaytext boolean,
    minscore double,
    graphsize int,
    labelsize int,
    graphdata blob,
    labeldata blob,
    PRIMARY KEY ((domainkey), model, nodeid)
)WITH CLUSTERING ORDER BY (model ASC);


--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.messageobjectrecognitions
(
    domainkey varchar,
    msgid int,
    field varchar,
    ortype varchar,
    ormodel varchar,
    ispublic boolean,
    description varchar,
    namedRule varchar,
    PRIMARY KEY ((domainkey), msgid, field)
)WITH CLUSTERING ORDER BY (msgid ASC, field ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.publicfiles
(
    id uuid,
    domainkey varchar,
    description varchar,
    mediatype varchar,
    tags varchar,
    data blob,
    PRIMARY KEY ((id), domainkey)
)WITH CLUSTERING ORDER BY (domainkey ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainfiles
(
    id uuid,
    domainkey varchar,
    description varchar,
    mediatype varchar,
    tags varchar,
    data blob,
    PRIMARY KEY ((domainkey), id)
)WITH CLUSTERING ORDER BY (id ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.records
(
    domainkey varchar,
    recordid bigint,
    indexid varchar,
    createdstamp timestamp,
    data varchar,
    PRIMARY KEY ((domainkey), recordid, indexid, createdstamp)
)WITH CLUSTERING ORDER BY (recordid ASC, indexid ASC, createdstamp ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gbltemplates
(
    name varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (name)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainmessagefields(
    domainkey varchar,
    msgid varchar,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((domainkey), msgid, name)
)WITH CLUSTERING ORDER BY (msgid ASC, name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.domainmessagespecifications(
    domainkey varchar,
    msgid varchar,
    name varchar,
    label varchar,
    description varchar,
    finalized boolean,
    PRIMARY KEY ((domainkey), msgid)
)WITH CLUSTERING ORDER BY (msgid ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblmessagefields(
    msgid varchar,
    name varchar,
    domainkey varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((msgid), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblmessagespecifications(
    msgid varchar,
    name varchar,
    domainkey varchar,
    label varchar,
    description varchar,
    finalized boolean,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblrecordfields(
    domainkey varchar,
    msgid varchar,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((msgid), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblrecordspecifications(
    domainkey varchar,
    msgid varchar,
    name varchar,
    label varchar,
    description varchar,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblmessagerules
(
    msgid varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblnamedrules
(
    name varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (name)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblscheduledrules
(
    id varchar,
    domainkey varchar,
    pattern varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblnodescheduledrules
(
    id varchar,
    domainkey varchar,
    nodeid varchar,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gblbinaryrules
(
    type varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    description varchar,
    PRIMARY KEY (type)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.gbljobs
(
    id varchar,
    domainkey varchar,
    name varchar,
    jobtype varchar,
    jobstate varchar,
    joblanguage varchar,
    jobcode varchar,
    instances int,
    systemjob boolean, 
    startonboot boolean,
    restartonchange boolean,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.systemjobs
(
    id varchar,
    domainkey varchar,
    name varchar,
    jobtype varchar,
    jobstate varchar,
    joblanguage varchar,
    jobcode varchar,
    instances int,
    systemjob boolean, 
    startonboot boolean,
    restartonchange boolean,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.systemplates
(
    name varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (name)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysmessagefields(
    msgid varchar,
    name varchar,
    domainkey varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((msgid), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysmessagespecifications(
    msgid varchar,
    name varchar,
    domainkey varchar,
    label varchar,
    description varchar,
    finalized boolean,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysrecordfields(
    domainkey varchar,
    msgid varchar,
    name varchar,
    cqltype varchar,
    label varchar,
    description varchar,
    format varchar,
    PRIMARY KEY ((msgid), name)
)WITH CLUSTERING ORDER BY (name ASC);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysrecordspecifications(
    domainkey varchar,
    msgid varchar,
    name varchar,
    label varchar,
    description varchar,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysmessagerules
(
    msgid varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (msgid)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysnamedrules
(
    name varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (name)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysscheduledrules
(
    id varchar,
    domainkey varchar,
    pattern varchar,
    code varchar,
    language varchar,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysnodescheduledrules
(
    id varchar,
    domainkey varchar,
    nodeid varchar,
    PRIMARY KEY (id)
);

--CQL3--
CREATE TABLE IF NOT EXISTS boodskapks.sysbinaryrules
(
    type varchar,
    domainkey varchar,
    code varchar,
    language varchar,
    description varchar,
    PRIMARY KEY (type)
);

--CQL3--
create index IF NOT EXISTS  on boodskapks.nodescheduledrules (nodeid);
--CQL3--
create index IF NOT EXISTS  on boodskapks.users (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.rawmessages (deviceid);
--CQL3--
create index IF NOT EXISTS  on boodskapks.outgoingvoices (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.outgoingfcms (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.outgoingemails (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentemails (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentsms (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentsms (sid);
--CQL3--
create index IF NOT EXISTS  on boodskapks.publicfiles (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.frpredictionimages (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentvoices (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentvoices (sid);
--CQL3--
create index IF NOT EXISTS  on boodskapks.frmodelnodes  (nodeid);
--CQL3--
create index IF NOT EXISTS  on boodskapks.outgoingsms (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sentfcms (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.domainfiles (id);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gbltemplates (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblmessagefields (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblmessagespecifications (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblrecordfields (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblrecordspecifications (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblmessagerules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblnamedrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblscheduledrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblnodescheduledrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gblbinaryrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.systemplates (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysmessagefields (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysmessagespecifications (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysrecordfields (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysrecordspecifications (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysmessagerules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysnamedrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysscheduledrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysnodescheduledrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.sysbinaryrules (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.gbljobs (domainkey);
--CQL3--
create index IF NOT EXISTS  on boodskapks.systemjobs (domainkey);

