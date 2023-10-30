#ifndef DECLARATIVEGLOBAL_H
#define DECLARATIVEGLOBAL_H

#include <QtGlobal>
#include <QLoggingCategory>

#if defined(LYCHEE_DECLARATIVE)
#define LYCHEE_DECLARATIVE_EXPORT Q_DECL_EXPORT
#else
#define LYCHEE_DECLARATIVE_EXPORT Q_DECL_IMPORT
#endif

Q_DECLARE_LOGGING_CATEGORY(LYCHEE_DECLARATIVE)

#endif // DECLARATIVEGLOBAL_H